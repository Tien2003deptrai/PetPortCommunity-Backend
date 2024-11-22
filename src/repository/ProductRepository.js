const { Sequelize } = require('sequelize');
const { Product, User, sequelize, Category, Review } = require('~/models');

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

  async findProductByIdPrimary(id) {
    return Product.findByPk(id);
  }

  async updateProduct(productId, updateData) {
    const [updatedCount] = await Product.update(updateData, {
      where: { id: productId },
    });

    if (updatedCount === 0) {
      throw new Error('Product not found or no changes applied');
    }

    return Product.findByPk(productId);
  }

  async deleteProduct(productId) {
    const product = await Product.findByPk(productId);
    if (!product) throw new Error('Product not found');

    await product.destroy();
    return product;
  }

  async findAndCountProducts(options) {
    return Product.findAndCountAll(options);
  }

  async findById(id) {
    return await Product.findByPk(id);
  }

  async updateStock(productId, quantityChange, transaction) {
    const product = await Product.findByPk(productId);
    if (!product) throw new Error('Product not found');

    const newStock = product.stock_quantity + quantityChange;
    if (newStock < 0) throw new Error('Insufficient stock');

    product.stock_quantity = newStock;
    await product.save({ transaction });
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

  async findProductsBySellerId(sellerId) {
    return Product.findAll({
      where: { sales_center_id: sellerId },
      include: [
        {
          model: User,
          as: 'SalesCenter',
          attributes: [
            'id',
            'full_name',
            'store_name',
            'store_address',
            'store_logo',
            'business_license',
            'store_description',
          ],
          where: {
            where: Sequelize.literal(`JSON_CONTAINS(role, '"Seller"')`),
          },
        },
      ],
    });
  }
}

module.exports = new ProductRepository();
