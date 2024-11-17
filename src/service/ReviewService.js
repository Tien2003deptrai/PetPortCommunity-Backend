const reviewRepo = require('~/repository/ReviewRepository');

class ReviewService {
  async createReview(data) {
    return reviewRepo.createReview(data);
  }

  async getAllReviews() {
    const includeOptions = [
      { model: User, as: 'PetOwner', attributes: ['id', 'username', 'full_name'] },
      { model: Product, as: 'Product', attributes: ['id', 'name'] },
    ];
    return reviewRepo.findAllReviews(includeOptions);
  }

  async getReviewById(id) {
    const includeOptions = [
      { model: User, as: 'PetOwner', attributes: ['id', 'username', 'full_name'] },
      { model: Product, as: 'Product', attributes: ['id', 'name'] },
    ];
    const review = await reviewRepo.findReviewById(id, includeOptions);
    if (!review) throw new Error('Review not found');
    return review;
  }

  async updateReview(id, data) {
    const [updated] = await reviewRepo.updateReview(id, data);
    if (!updated) throw new Error('Review not found');
    return reviewRepo.findReviewById(id);
  }

  async deleteReview(id) {
    const deleted = await reviewRepo.deleteReview(id);
    if (!deleted) throw new Error('Review not found');
  }

  async getAverageRating() {
    const result = await reviewRepo.getAverageRating();
    return result[0];
  }

  async getReviewsByProduct(productId) {
    const includeOptions = [
      { model: User, as: 'PetOwner', attributes: ['id', 'username', 'full_name'] },
    ];
    return reviewRepo.findReviewsByProduct(productId, includeOptions);
  }
}

module.exports = new ReviewService();
