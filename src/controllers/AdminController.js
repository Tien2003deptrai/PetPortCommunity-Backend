const AdminService = require('~/service/AdminService');

const AdminController = {
  async deleteUser(req, res, next) {
    try {
      const { id } = req.params;
      const result = await AdminService.deleteUser(id);
      res.json(result);
    } catch (error) {
      next(error);
    }
  },

  async updateAvatar(req, res, next) {
    try {
      const userId = req.user.id;
      const { imageUrl } = req.body;
      const result = await AdminService.updateAvatar(userId, imageUrl);
      res.status(200).json(result);
    } catch (error) {
      next(error);
    }
  },

  async upgradeToDoctor(req, res, next) {
    try {
      const { userId } = req.body;
      const doctorData = req.body;
      const result = await AdminService.upgradeToDoctor(userId, doctorData);
      res.status(200).json(result);
    } catch (error) {
      next(error);
    }
  },

  async approveDoctor(req, res, next) {
    try {
      const { userId } = req.params;
      const result = await AdminService.approveDoctor(userId);
      res.status(200).json(result);
    } catch (error) {
      next(error);
    }
  },

  async upgradeToSeller(req, res, next) {
    try {
      const { userId } = req.body;
      const sellerData = req.body;
      const result = await AdminService.upgradeToSeller(userId, sellerData);
      res.status(200).json(result);
    } catch (error) {
      next(error);
    }
  },

  async approveSeller(req, res, next) {
    try {
      const { userId } = req.params;
      const result = await AdminService.approveSeller(userId);
      res.status(200).json(result);
    } catch (error) {
      next(error);
    }
  },
};

module.exports = AdminController;
