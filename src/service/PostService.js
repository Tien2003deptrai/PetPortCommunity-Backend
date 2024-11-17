const { User, Comment } = require('~/models');
const postRepo = require('~/repository/PostRepository');

class PostService {
  async createPost(data) {
    return postRepo.createPost(data);
  }

  async getAllPosts(page, limit) {
    const offset = (page - 1) * limit;
    const options = {
      limit,
      offset,
      include: [
        { model: User, as: 'PostOwner', attributes: ['id', 'username', 'full_name'] },
        { model: Comment, as: 'PostComments', attributes: ['id', 'content', 'createdAt'] },
      ],
    };
    return postRepo.findAllPosts(options);
  }

  async getPostById(id) {
    const post = await postRepo.findPostById(id);
    if (!post) throw new Error('Post not found');
    return post;
  }

  async updatePost(id, data) {
    const [updated] = await postRepo.updatePost(id, data);
    if (!updated) throw new Error('Post not found');
    return postRepo.findPostById(id);
  }

  async deletePost(id) {
    const deleted = await postRepo.deletePost(id);
    if (!deleted) throw new Error('Post not found');
  }

  async searchPostsByTitle(title) {
    return postRepo.searchPostsByTitle(title);
  }

  async getPostsByUser(userId) {
    return postRepo.findPostsByUser(userId);
  }

  async countPosts() {
    return postRepo.countPosts();
  }
}

module.exports = new PostService();
