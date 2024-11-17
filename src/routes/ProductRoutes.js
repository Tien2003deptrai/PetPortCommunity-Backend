const express = require('express');
const { ProductController } = require('~/controllers');
const { validate } = require('~/middlewares');
const { ProductValidation } = require('~/validations');

const router = express.Router();

router.post('/', validate(ProductValidation.create), ProductController.create);

router.get('/panigated', ProductController.getPaginatedProducts);

router.get('/search', ProductController.search);

router.get(
  '/top-rating',
  validate(ProductValidation.delete),
  ProductController.getTopRatedProducts
);

router.get('/:id', ProductController.getProductById);

module.exports = router;
