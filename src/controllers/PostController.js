const postService = require('~/service/PostService');

const PostController = {
  async create(req, res, next) {
    try {
      const post = await postService.createPost(req.body);
      res.status(201).json({ success: true, data: post });
    } catch (error) {
      next(error);
    }
  },

  async getAll(req, res, next) {
    const { page = 1, limit = 10 } = req.query;
    try {
      const posts = await postService.getAllPosts(parseInt(page, 10), parseInt(limit, 10));
      res.status(200).json({ success: true, data: posts.rows, total: posts.count });
    } catch (error) {
      next(error);
    }
  },

  async getById(req, res, next) {
    try {
      const post = await postService.getPostById(req.params.id);
      res.status(200).json({ success: true, data: post });
    } catch (error) {
      next(error);
    }
  },

  async update(req, res, next) {
    try {
      const updatedPost = await postService.updatePost(req.params.id, req.body);
      res.status(200).json({ success: true, data: updatedPost });
    } catch (error) {
      next(error);
    }
  },

  async delete(req, res, next) {
    try {
      await postService.deletePost(req.params.id);
      res.status(200).json({ success: true, message: 'Deleted successfully' });
    } catch (error) {
      next(error);
    }
  },

  async searchPostsByTitle(req, res, next) {
    const { title } = req.query;
    try {
      const posts = await postService.searchPostsByTitle(title);
      res.status(200).json({ success: true, data: posts });
    } catch (error) {
      next(error);
    }
  },

  async getPostsByUser(req, res, next) {
    try {
      const posts = await postService.getPostsByUser(req.params.petOwner_Id);
      res.status(200).json({ success: true, data: posts });
    } catch (error) {
      next(error);
    }
  },

  async countPosts(req, res, next) {
    try {
      const totalPosts = await postService.countPosts();
      res.status(200).json({ success: true, data: totalPosts });
    } catch (error) {
      next(error);
    }
  },
};

module.exports = PostController;
