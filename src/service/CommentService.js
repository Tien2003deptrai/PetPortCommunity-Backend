const commentRepo = require('~/repository/CommentRepository');

class CommentService {
  async createComment(data) {
    return commentRepo.createComment(data);
  }

  async getAllComments() {
    return commentRepo.findAllComments({});
  }

  async getCommentById(id) {
    const comment = await commentRepo.findCommentById(id);
    if (!comment) {
      throw new Error('Comment not found');
    }
    return comment;
  }

  async updateComment(id, data) {
    const [updated] = await commentRepo.updateCommentById(id, data);
    if (!updated) {
      throw new Error('Comment not found');
    }
    return commentRepo.findCommentById(id);
  }

  async deleteComment(id) {
    const deleted = await commentRepo.deleteCommentById(id);
    if (!deleted) {
      throw new Error('Comment not found');
    }
  }

  async getCommentsByPost(post_id) {
    return commentRepo.findCommentsByPostId(post_id);
  }

  async getCommentsByPetOwner(petOwner_Id) {
    return commentRepo.findCommentsByPetOwnerId(petOwner_Id);
  }
}

module.exports = new CommentService();
