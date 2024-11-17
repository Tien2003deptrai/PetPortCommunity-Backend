const { Comment, User } = require('~/models');

class CommentRepository {
  async createComment(data) {
    return Comment.create(data);
  }

  async findAllComments(options) {
    return Comment.findAll({
      include: [
        {
          model: User,
          as: 'CommentUser',
          attributes: ['id', 'username', 'full_name'],
        },
      ],
      ...options,
    });
  }

  async findCommentById(id) {
    return Comment.findByPk(id, {
      include: [
        {
          model: User,
          as: 'CommentUser',
          attributes: ['id', 'username', 'full_name'],
        },
      ],
    });
  }

  async updateCommentById(id, data) {
    return Comment.update(data, { where: { id } });
  }

  async deleteCommentById(id) {
    return Comment.destroy({ where: { id } });
  }

  async findCommentsByPostId(post_id) {
    return Comment.findAll({
      where: { post_id },
      include: [
        {
          model: User,
          as: 'CommentUser',
          attributes: ['id', 'username', 'full_name'],
        },
      ],
    });
  }

  async findCommentsByPetOwnerId(petOwner_Id) {
    return Comment.findAll({
      where: { petOwner_Id },
      include: [
        {
          model: User,
          as: 'CommentUser',
          attributes: ['id', 'username', 'full_name'],
        },
      ],
    });
  }
}

module.exports = new CommentRepository();
