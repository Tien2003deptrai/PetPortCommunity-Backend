const { Product } = require('~/models');

class ProductRepository {
  async createProduct(data) {
    return Product.create(data);
  }

  async findProductById(id) {
    return Product.findByPk(id, {
      include: [
        { model: Category, as: 'Category', attributes: ['id', 'name'] },
        {
          model: Review,
          as: 'ProductReviews',
          attributes: ['id', 'rating', 'comment', 'createdAt'],
        },
        { model: User, as: 'SalesCenter', attributes: ['id', 'full_name'] },
      ],
    });
  }

  async findAndCountProducts(options) {
    return Product.findAndCountAll(options);
  }

  async findProductsByCriteria(whereClause, includeOptions) {
    return Product.findAll({
      where: whereClause,
      include: includeOptions,
    });
  }

  async getTopRatedProducts(limit) {
    return Product.findAll({
      attributes: {
        include: [[sequelize.fn('AVG', sequelize.col('ProductReviews.rating')), 'avgRating']],
      },
      include: [
        { model: Review, as: 'ProductReviews', attributes: [] },
        { model: Category, as: 'Category', attributes: ['id', 'name'] },
      ],
      group: ['Product.id'],
      order: [[sequelize.literal('avgRating'), 'DESC']],
      limit,
      subQuery: false,
    });
  }
}

module.exports = new ProductRepository();
