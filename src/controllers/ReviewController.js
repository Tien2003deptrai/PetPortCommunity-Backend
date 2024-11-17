const reviewService = require('~/service/ReviewService');

const ReviewController = {
  async create(req, res, next) {
    try {
      const review = await reviewService.createReview(req.body);
      res.status(201).json({ success: true, data: review });
    } catch (error) {
      next(error);
    }
  },

  async getAll(req, res, next) {
    try {
      const reviews = await reviewService.getAllReviews();
      res.status(200).json({ success: true, data: reviews });
    } catch (error) {
      next(error);
    }
  },

  async getById(req, res, next) {
    try {
      const review = await reviewService.getReviewById(req.params.id);
      res.status(200).json({ success: true, data: review });
    } catch (error) {
      next(error);
    }
  },

  async update(req, res, next) {
    try {
      const updatedReview = await reviewService.updateReview(req.params.id, req.body);
      res.status(200).json({ success: true, data: updatedReview });
    } catch (error) {
      next(error);
    }
  },

  async delete(req, res, next) {
    try {
      await reviewService.deleteReview(req.params.id);
      res.status(200).json({ success: true, message: 'Delete successfully' });
    } catch (error) {
      next(error);
    }
  },

  async getAverageRating(req, res, next) {
    try {
      const averageRating = await reviewService.getAverageRating();
      res.status(200).json({ success: true, data: averageRating });
    } catch (error) {
      next(error);
    }
  },

  async getReviewsByProduct(req, res, next) {
    try {
      const reviews = await reviewService.getReviewsByProduct(req.params.product_id);
      res.status(200).json({ success: true, data: reviews });
    } catch (error) {
      next(error);
    }
  },
};

module.exports = ReviewController;
