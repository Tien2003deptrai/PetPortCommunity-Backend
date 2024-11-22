const express = require('express');
const { ProductController } = require('~/controllers');
const { validate } = require('~/middlewares');
const { ProductValidation } = require('~/validations');

const router = express.Router();

router.get('/paginated', ProductController.getPaginatedProducts);

router.get('/search', ProductController.search);

router.get('/top-rating', ProductController.getTopRatedProducts);

router.get('/seller/:seller_id', ProductController.getProductsBySellerId);

router.post('/', validate(ProductValidation.create), ProductController.create);

router.get('/:id', ProductController.getProductById);

router.put('/:id', ProductController.updateProduct);

router.delete('/:id', validate(ProductValidation.delete), ProductController.deleteProduct);

module.exports = router;
