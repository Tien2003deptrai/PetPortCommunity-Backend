const UserService = require('~/service/UserService');

const UserController = {
  async register(req, res, next) {
    try {
      const newUser = await UserService.register(req.body, res);
      res.status(201).json({ success: true, user: newUser });
    } catch (error) {
      next(error);
    }
  },

  async verifyEmail(req, res, next) {
    try {
      const user = await UserService.verifyEmail(req.body.code);
      res.status(200).json({ success: true, user });
    } catch (error) {
      next(error);
    }
  },

  async login(req, res, next) {
    try {
      const result = await UserService.login(req.body, res);
      res.status(200).json({ success: true, ...result });
    } catch (error) {
      next(error);
    }
  },

  async forgotPassword(req, res, next) {
    try {
      const result = await UserService.forgotPassword(req.body.email);
      res.json(result);
    } catch (error) {
      next(error);
    }
  },

  async resetPassword(req, res, next) {
    try {
      const result = await UserService.resetPassword(req.params.token, req.body.password);
      res.status(200).json(result);
    } catch (error) {
      next(error);
    }
  },

  async getDoctors(req, res, next) {
    try {
      const doctors = await UserService.getDoctors();
      res.status(200).json({ success: true, doctors });
    } catch (error) {
      next(error);
    }
  },

  async getUserById(req, res, next) {
    try {
      const user = await UserService.getUserById(req.params.id);
      res.status(200).json({ success: true, user });
    } catch (error) {
      next(error);
    }
  },

  async updateUserInfo(req, res, next) {
    try {
      const user = await UserService.updateUserInfo(req.params.id, req.body);
      res.status(200).json({ success: true, user });
    } catch (error) {
      next(error);
    }
  },

  async deleteUser(req, res, next) {
    try {
      const result = await UserService.deleteUser(req.params.id);
      res.status(200).json(result);
    } catch (error) {
      next(error);
    }
  },
};

module.exports = UserController;
