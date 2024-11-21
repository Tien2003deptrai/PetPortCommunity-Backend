const productService = require('~/service/ProductService');

const ProductController = {
  async create(req, res, next) {
    try {
      const product = await productService.createProduct(req.body);
      res.status(201).json({ success: true, data: product });
    } catch (error) {
      next(error);
    }
  },

  async getProductById(req, res, next) {
    try {
      const product = await productService.getProductById(req.params.id);
      res.status(200).json({ success: true, data: product });
    } catch (error) {
      next(error);
    }
  },

  async getPaginatedProducts(req, res, next) {
    const { limit = 10, page = 1 } = req.query;
    try {
      const { rows: products, count: totalItems } = await productService.getPaginatedProducts(
        parseInt(limit),
        parseInt(page)
      );
      res.status(200).json({
        success: true,
        data: products,
        pagination: {
          totalItems,
          totalPages: Math.ceil(totalItems / limit),
          currentPage: parseInt(page),
        },
      });
    } catch (error) {
      next(error);
    }
  },

  async search(req, res, next) {
    const { name } = req.query;
    try {
      const products = await productService.searchProducts(name);
      res.status(200).json({ success: true, data: products });
    } catch (error) {
      next(error);
    }
  },

  async getTopRatedProducts(req, res, next) {
    const { limit = 10 } = req.query;
    try {
      const products = await productService.getTopRatedProducts(parseInt(limit));
      res.status(200).json({ success: true, data: products });
    } catch (error) {
      next(error);
    }
  },

  async getProductsBySellerId(req, res, next) {
    try {
      const { seller_id } = req.params;
      const products = await productService.getProductsBySellerId(seller_id);
      res.status(200).json({ success: true, data: products });
    } catch (error) {
      next(error);
    }
  },
};

module.exports = ProductController;
