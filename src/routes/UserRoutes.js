const express = require('express');
const { UserController } = require('~/controllers');
const { validate } = require('~/middlewares');
const { UserValidation } = require('~/validations');
const router = express.Router();

router.post('/register', validate(UserValidation.register), UserController.register);
router.post('/login', validate(UserValidation.login), UserController.login);
router.post('/logout', UserController.logout);
// router.post('/refresh-token', UserController.refreshToken);
router.post('/verify-email', validate(UserValidation.verifyEmail), UserController.verifyEmail);
router.post('/forgot-password', UserController.forgotPassword);
router.post(
  '/reset-password/:token',
  validate(UserValidation.resetPassword),
  UserController.resetPassword
);
router.get('/users', UserController.getDoctors);
router.get('/users/:id', UserController.getUserById);
router.put('/users/:id', UserController.updateUserInfo);

module.exports = router;
