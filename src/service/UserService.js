const bcrypt = require('bcryptjs');
const crypto = require('crypto');
const {
  sendVerificationEmail,
  sendResetSuccessEmail,
  sendPasswordResetEmail,
} = require('~/mail/emails');
const userRepo = require('~/repository/UserRepository');

class UserService {
  async registerUser({ username, password, email }) {
    const existingUser = await userRepo.findUserByEmailOrUsername(email, username);
    if (existingUser) throw new Error('Username or email already taken');

    const hashedPassword = await bcrypt.hash(password, 10);
    const verificationToken = Math.floor(100000 + Math.random() * 900000).toString();

    const newUser = await userRepo.createUser({
      username,
      password: hashedPassword,
      email,
      verification_token: verificationToken,
      verification_token_expires_at: new Date(Date.now() + 24 * 60 * 60 * 1000),
    });

    await sendVerificationEmail(newUser.email, verificationToken);
    return newUser;
  }

  async verifyEmail(code) {
    const user = await userRepo.findUserByVerificationCode(code);
    if (!user) throw new Error('Invalid or expired verification code');

    user.is_verified = true;
    user.verification_token = null;
    user.verification_token_expires_at = null;
    await user.save();
    return user;
  }

  async login(email, password) {
    const user = await userRepo.findUserByEmailOrUsername(email, null);
    if (!user || !(await bcrypt.compare(password, user.password))) {
      throw new Error('Invalid credentials');
    }
    return user;
  }

  async resetPassword(token, newPassword) {
    const user = await userRepo.findUserByResetToken(token);
    if (!user) throw new Error('Invalid or expired reset token');

    const hashedPassword = await bcrypt.hash(newPassword, 10);
    user.password = hashedPassword;
    user.reset_password_token = null;
    user.reset_password_expires_at = null;
    await user.save();

    await sendResetSuccessEmail(user.email);
  }

  async forgotPassword(email) {
    const user = await userRepo.findUserByEmailOrUsername(email, null);
    if (!user) throw new Error('User not found');

    const resetToken = crypto.randomBytes(20).toString('hex');
    user.reset_password_token = resetToken;
    user.reset_password_expires_at = new Date(Date.now() + 60 * 60 * 1000);
    await user.save();

    await sendPasswordResetEmail(
      user.email,
      `${process.env.FRONTEND_URL}/reset-password/${resetToken}`
    );
  }

  async getUserById(id) {
    const user = await userRepo.findUserById(id);
    if (!user) throw new Error('User not found');
    return user;
  }

  async getDoctors() {
    const doctors = await userRepo.findDoctors();
    if (!doctors || doctors.length === 0) throw new Error('No doctors found');
    return doctors;
  }

  async updateUserInfo(id, data) {
    const user = await userRepo.findUserById(id);
    if (!user) throw new Error('User not found');
    return userRepo.updateUserById(id, data);
  }

  async refreshAccessToken(refreshToken) {
    if (!refreshToken) {
      throw new Error('No refresh token provided');
    }

    try {
      const decoded = jwt.verify(refreshToken, process.env.JWT_SECRET);
      const { token: newAccessToken, expiresAt } = generateToken(decoded.userId, decoded.role);
      return { newAccessToken, expiresAt };
    } catch (error) {
      console.error('Error verifying refresh token:', error);
      throw new Error('Invalid refresh token');
    }
  }
}

module.exports = new UserService();
