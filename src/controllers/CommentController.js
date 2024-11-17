const commentService = require('~/service/CommentService');

const CommentController = {
  async create(req, res, next) {
    try {
      const comment = await commentService.createComment(req.body);
      res.status(200).json({ success: true, data: comment });
    } catch (error) {
      next(error);
    }
  },

  async getAll(req, res, next) {
    try {
      const comments = await commentService.getAllComments();
      res.status(200).json({ success: true, data: comments });
    } catch (error) {
      next(error);
    }
  },

  async getById(req, res, next) {
    try {
      const comment = await commentService.getCommentById(req.params.id);
      res.status(200).json({ success: true, data: comment });
    } catch (error) {
      next(error);
    }
  },

  async update(req, res, next) {
    try {
      const updatedComment = await commentService.updateComment(req.params.id, req.body);
      res.status(200).json({ success: true, data: updatedComment });
    } catch (error) {
      next(error);
    }
  },

  async delete(req, res, next) {
    try {
      await commentService.deleteComment(req.params.id);
      res.status(200).json({ success: true, message: 'Delete successfully' });
    } catch (error) {
      next(error);
    }
  },

  async getCommentsByPost(req, res, next) {
    try {
      const comments = await commentService.getCommentsByPost(req.params.post_id);
      res.status(200).json({ success: true, data: comments });
    } catch (error) {
      next(error);
    }
  },

  async getCommentsByPetOwner(req, res, next) {
    try {
      const comments = await commentService.getCommentsByPetOwner(req.params.petOwner_Id);
      res.status(200).json({ success: true, data: comments });
    } catch (error) {
      next(error);
    }
  },

  async checkCommentExists(req, res, next) {
    try {
      const result = await commentService.checkCommentExists(req.params.id);
      res.status(200).json({ success: true, message: result });
    } catch (error) {
      next(error);
    }
  },
};

module.exports = CommentController;
