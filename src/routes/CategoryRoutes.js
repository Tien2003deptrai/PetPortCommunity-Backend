const express = require('express');
const { CategoryController } = require('~/controllers');
const { validate } = require('~/middlewares');
const { CategoryValidation } = require('~/validations');
const router = express.Router();

router.post('/', validate(CategoryValidation.create), CategoryController.create);

router.get('/', CategoryController.getAll);

router.get('/search', CategoryController.getByType);

router.get('/:id', validate(CategoryValidation.getById), CategoryController.getById);

router.put('/:id', validate(CategoryValidation.update), CategoryController.update);

router.delete('/:id', validate(CategoryValidation.delete), CategoryController.delete);

module.exports = router;
