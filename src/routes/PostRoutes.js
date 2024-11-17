const express = require('express');
const { PostController } = require('~/controllers');
const { validate } = require('~/middlewares');
const { PostValidation } = require('~/validations');

const router = express.Router();

router.post('/', validate(PostValidation.create), PostController.create);

router.get('/paginated', PostController.getAll);

router.get('/all', PostController.getAll);

router.get(
  '/search',
  validate(PostValidation.searchPostsByTitle),
  PostController.searchPostsByTitle
);

router.get('/count', PostController.countPosts);

router.get('/:id', validate(PostValidation.getById), PostController.getById);

router.put('/:id', validate(PostValidation.update), PostController.update);

router.delete('/:id', validate(PostValidation.delete), PostController.delete);

router.get(
  '/pet_owner/:petOwner_Id',
  validate(PostValidation.getPostsByUser),
  PostController.getPostsByUser
);

module.exports = router;
