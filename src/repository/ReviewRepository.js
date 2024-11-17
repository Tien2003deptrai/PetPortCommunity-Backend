const { Review, sequelize } = require('~/models');

class ReviewRepository {
  async createReview(data) {
    return Review.create(data);
  }

  async findAllReviews(includeOptions) {
    return Review.findAll({ include: includeOptions });
  }

  async findReviewById(id, includeOptions) {
    return Review.findByPk(id, { include: includeOptions });
  }

  async updateReview(id, data) {
    return Review.update(data, { where: { id } });
  }

  async deleteReview(id) {
    return Review.destroy({ where: { id } });
  }

  async getAverageRating() {
    return Review.findAll({
      attributes: [[sequelize.fn('AVG', sequelize.col('rating')), 'averageRating']],
    });
  }

  async findReviewsByProduct(productId, includeOptions) {
    return Review.findAll({
      where: { product_id: productId },
      include: includeOptions,
    });
  }
}

module.exports = new ReviewRepository();
