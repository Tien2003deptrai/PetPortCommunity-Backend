const { Post, User, Comment, Op } = require('~/models');

class PostRepository {
  async createPost(data) {
    return Post.create(data);
  }

  async findAllPosts(options) {
    return Post.findAndCountAll(options);
  }

  async findPostById(id) {
    return Post.findByPk(id, {
      include: [
        { model: User, as: 'PostOwner', attributes: ['id', 'username', 'full_name'] },
        { model: Comment, as: 'PostComments', attributes: ['id', 'content', 'createdAt'] },
      ],
    });
  }

  async updatePost(id, data) {
    return Post.update(data, { where: { id } });
  }

  async deletePost(id) {
    return Post.destroy({ where: { id } });
  }

  async searchPostsByTitle(title) {
    return Post.findAll({
      where: { title: { [Op.like]: `%${title}%` } },
      include: [{ model: User, as: 'PostOwner', attributes: ['id', 'username', 'full_name'] }],
    });
  }

  async findPostsByUser(userId) {
    return Post.findAll({
      where: { petOwner_Id: userId },
      include: [{ model: User, as: 'PostOwner', attributes: ['id', 'username', 'full_name'] }],
    });
  }

  async countPosts() {
    return Post.count();
  }

  async findLatestPosts(limit) {
    return Post.findAll({
      order: [['createdAt', 'DESC']],
      limit,
      include: [{ model: User, as: 'PostOwner', attributes: ['id', 'username', 'full_name'] }],
    });
  }
}

module.exports = new PostRepository();
