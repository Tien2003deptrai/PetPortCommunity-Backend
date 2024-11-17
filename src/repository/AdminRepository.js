const { User } = require('~/models');

const AdminRepository = {
  async findUserById(userId) {
    return await User.findByPk(userId);
  },

  async deleteUserById(userId) {
    const user = await this.findUserById(userId);
    if (!user) return null;
    await user.destroy();
    return user;
  },

  async updateUser(userId, data) {
    const user = await this.findUserById(userId);
    if (!user) return null;
    await user.update(data);
    return user;
  },
};

module.exports = AdminRepository;
