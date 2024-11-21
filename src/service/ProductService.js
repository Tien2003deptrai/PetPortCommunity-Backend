const { Category, Review, User, Op } = require('~/models');
const productRepo = require('~/repository/ProductRepository');

class ProductService {
  async createProduct(data) {
    return productRepo.createProduct(data);
  }

  async getProductById(id) {
    const product = await productRepo.findProductById(id);
    if (!product) throw new Error('Product not found');
    return product;
  }

  async getPaginatedProducts(limit, page) {
    const offset = (page - 1) * limit;
    const options = {
      limit,
      offset,
      include: [
        { model: Category, as: 'Category', attributes: ['id', 'name'] },
        {
          model: Review,
          as: 'ProductReviews',
          attributes: ['id', 'rating', 'comment', 'createdAt'],
        },
        { model: User, as: 'SalesCenter', attributes: ['id', 'full_name'] },
      ],
    };
    return productRepo.findAndCountProducts(options);
  }

  async searchProducts(name) {
    const whereClause = name ? { name: { [Op.like]: `%${name}%` } } : {};
    const includeOptions = [
      { model: User, as: 'SalesCenter', attributes: ['id', 'full_name'] },
      { model: Category, as: 'Category', attributes: ['id', 'name'] },
    ];
    return productRepo.findProductsByCriteria(whereClause, includeOptions);
  }

  async getTopRatedProducts(limit = 10) {
    return productRepo.getTopRatedProducts(limit);
  }

  async getProductsBySellerId(sellerId) {
    const products = await productRepo.findProductsBySellerId(sellerId);
    if (!products || products.length === 0) {
      throw new Error('No products found for the given seller ID or the user is not a Seller.');
    }
    return products;
  }
}

module.exports = new ProductService();
