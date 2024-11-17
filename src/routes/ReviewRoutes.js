const express = require('express');
const { ReviewController } = require('~/controllers');
const { validate } = require('~/middlewares');
const { ReviewValidation } = require('~/validations');

const router = express.Router();

router.post('/', validate(ReviewValidation.create), ReviewController.create);

router.get('/', ReviewController.getAll);

router.get('/average-rating', ReviewController.getAverageRating);

router.get('/:id', validate(ReviewValidation.getById), ReviewController.getById);

router.put('/:id', validate(ReviewValidation.update), ReviewController.update);

router.delete('/:id', validate(ReviewValidation.delete), ReviewController.delete);

module.exports = router;
