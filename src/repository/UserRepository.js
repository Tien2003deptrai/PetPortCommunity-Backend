const { User } = require('~/models');
const { Op } = require('sequelize');

class UserRepository {
  async findUserByEmailOrUsername(email, username) {
    return User.findOne({
      where: {
        [Op.or]: [{ email }, { username }],
      },
    });
  }

  async findUserByVerificationCode(code) {
    return User.findOne({
      where: {
        verification_token: code,
        verification_token_expires_at: { [Op.gt]: new Date() },
      },
    });
  }

  async createUser(data) {
    return User.create(data);
  }

  async findUserById(id) {
    return User.findByPk(id);
  }

  async updateUserById(id, data) {
    return User.update(data, { where: { id } });
  }

  async deleteUserById(id) {
    return User.destroy({ where: { id } });
  }

  async findDoctors() {
    return User.findAll({ where: { role: { [Op.like]: '%Doctor%' } } });
  }

  async findUserByResetToken(token) {
    return User.findOne({
      where: {
        reset_password_token: token,
        reset_password_expires_at: { [Op.gt]: new Date() },
      },
    });
  }

  async findUserById(id) {
    return User.findByPk(id, {
      attributes: { exclude: ['password', 'createdAt', 'updatedAt'] },
    });
  }

  async findDoctors() {
    return User.findAll({
      where: { role: { [Op.like]: '%Doctor%' } },
      attributes: { exclude: ['password', 'createdAt', 'updatedAt'] },
    });
  }

  async updateUserById(id, data) {
    const user = await User.findByPk(id);
    if (!user) throw new Error('User not found');
    return user.update(data);
  }
}

module.exports = new UserRepository();
