const { User } = require('~/models');

class UserRepository {
  async findOneByCondition(condition) {
    return User.findOne({ where: condition });
  }

  async findById(id, options = {}) {
    return User.findByPk(id, options);
  }

  async findAllUsers() {
    return await User.findAll({
      attributes: {
        exclude: ['password', 'createdAt', 'updatedAt'],
      },
    });
  }

  async create(data) {
    return User.create(data);
  }

  async updateById(id, data) {
    const user = await this.findById(id);
    if (!user) throw new Error('User not found');
    return user.update(data);
  }

  async deleteById(id) {
    const user = await this.findById(id);
    if (!user) throw new Error('User not found');
    return user.destroy();
  }

  async save(user) {
    return user.save();
  }
}

module.exports = new UserRepository();
