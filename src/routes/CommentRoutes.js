const express = require('express');
const { CommentController } = require('~/controllers');
const { validate } = require('~/middlewares');
const { CommentValidation } = require('~/validations');

const router = express.Router();

router.post('/', validate(CommentValidation.create), CommentController.create);

router.get('/', CommentController.getAll);

router.get('/with-petOwner-info', CommentController.getCommentsByPetOwner);

router.get('/:id', validate(CommentValidation.getById), CommentController.getById);

router.put('/:id', validate(CommentValidation.update), CommentController.update);

router.delete('/:id', validate(CommentValidation.delete), CommentController.delete);

router.get(
  '/post/:post_id',
  validate(CommentValidation.getCommentsByPost),
  CommentController.getCommentsByPost
);

router.get(
  '/pet_owner/:petOwner_Id',
  validate(CommentValidation.getCommentsByUser),
  CommentController.getCommentsByPetOwner
);

module.exports = router;
