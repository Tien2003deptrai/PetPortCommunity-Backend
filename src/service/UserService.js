const bcrypt = require('bcryptjs');
const crypto = require('crypto');
const {
  sendPasswordResetEmail,
  sendVerificationEmail,
  sendWelcomeEmail,
  sendResetSuccessEmail,
} = require('~/mail/emails');
const { generateRefreshTokenAndSetCookie, generateToken } = require('~/utils/generateToken');
const UserRepository = require('~/repository/UserRepository');
const { Op } = require('sequelize');
const { comparePasswords } = require('~/utils/passwordUtils');

class UserService {
  async register(data, res) {
    const { username, password, email } = data;

    const existingUser = await UserRepository.findOneByCondition({
      [Op.or]: [{ email }],
    });
    if (existingUser) throw new Error('Username or email already taken');

    const verificationToken = Math.floor(100000 + Math.random() * 900000).toString();

    const newUser = await UserRepository.create({
      username,
      password,
      email,
      verification_token: verificationToken,
      verification_token_expires_at: new Date(Date.now() + 24 * 60 * 60 * 1000),
    });

    generateRefreshTokenAndSetCookie(res, newUser.id);

    await sendVerificationEmail(newUser.email, verificationToken);

    return newUser;
  }

  async verifyEmail(code) {
    const user = await UserRepository.findOneByCondition({
      verification_token: code,
      verification_token_expires_at: { [Op.gt]: new Date() },
    });

    if (!user) throw new Error('Invalid or expired verification code');

    user.is_verified = true;
    user.verification_token = null;
    user.verification_token_expires_at = null;

    await UserRepository.save(user);
    await sendWelcomeEmail(user.email, user.username);

    return user;
  }

  async login(data, res) {
    const { email, password } = data;

    const user = await UserRepository.findOneByCondition({ email });
    const isPasswordValid = await comparePasswords(password, user.password);
    if (!isPasswordValid) throw new Error('Invalid credentials');

    const { token, expiresAt } = generateToken(user.id, user.role);
    generateRefreshTokenAndSetCookie(res, user.id);

    user.lastLogin = new Date();
    await UserRepository.save(user);

    return { token, expiresAt, user };
  }

  async forgotPassword(email) {
    const user = await UserRepository.findOneByCondition({ email });
    if (!user) throw new Error('User not found');

    const resetToken = crypto.randomBytes(20).toString('hex');
    user.reset_password_token = resetToken;
    user.reset_password_expires_at = Date.now() + 1 * 60 * 60 * 1000;

    await UserRepository.save(user);

    await sendPasswordResetEmail(
      user.email,
      `${process.env.FRONTEND_URL}/reset-password/${resetToken}`
    );
    return { success: true };
  }

  async resetPassword(token, newPassword) {
    const user = await UserRepository.findOneByCondition({
      reset_password_token: token,
      reset_password_expires_at: { [Op.gt]: new Date() },
    });

    if (!user) throw new Error('Invalid or expired reset token');

    const hashedPassword = await bcrypt.hash(newPassword, 10);
    user.password = hashedPassword;
    user.reset_password_token = null;
    user.reset_password_expires_at = null;

    await UserRepository.save(user);
    await sendResetSuccessEmail(user.email);

    return { success: true };
  }

  async getDoctors() {
    const users = await UserRepository.findAllUsers();

    const doctorUsers = users.filter(user => {
      if (Array.isArray(user.role)) {
        return user.role.includes('Doctor');
      }
      return false;
    });

    if (doctorUsers.length === 0) {
      throw new Error('No doctors found');
    }

    return doctorUsers;
  }

  async updateUserInfo(userId, data) {
    const user = await UserRepository.findById(userId);
    if (!user) throw new Error('User not found');

    await user.update(data);
    return user;
  }

  async deleteUser(userId) {
    await UserRepository.deleteById(userId);
    return { message: 'User deleted successfully' };
  }

  async getUserById(userId) {
    const user = await UserRepository.findById(userId, {
      attributes: { exclude: ['password', 'createdAt', 'updatedAt'] },
    });

    if (!user) throw new Error('User not found');
    return user;
  }
}

module.exports = new UserService();
