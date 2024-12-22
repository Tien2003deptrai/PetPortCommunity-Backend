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
      res.status(200).json({ success: true, data: result });
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
      res.status(200).json({ success: true, data: result });
    } catch (error) {
      next(error);
    }
  },

  async getPendingDoctors(req, res, next) {
    try {
      const pendingDoctors = await AdminService.getPendingDoctors();
      console.log('pendingDoctors', pendingDoctors);
      res.status(200).json({
        success: true,
        data: pendingDoctors,
      });
    } catch (error) {
      next(error);
    }
  },

  async getRegisteredDoctors(req, res, next) {
    try {
      const registeredDoctors = await AdminService.getRegisteredDoctors();
      res.status(200).json({
        success: true,
        data: registeredDoctors,
      });
    } catch (error) {
      next(error);
    }
  },

  async getPendingSellers(req, res, next) {
    try {
      const pendingSellers = await AdminService.getPendingSellers();
      res.status(200).json({
        success: true,
        data: pendingSellers,
      });
    } catch (error) {
      next(error);
    }
  },

  async getRegisteredSellers(req, res, next) {
    try {
      const registeredSellers = await AdminService.getRegisteredSellers();
      res.status(200).json({
        success: true,
        data: registeredSellers,
      });
    } catch (error) {
      next(error);
    }
  },

  async getAllPetOwners(req, res, next) {
    try {
      const petOwners = await AdminService.getAllPetOwners();
      res.status(200).json(petOwners);
    } catch (error) {
      next(error);
    }
  },
};

module.exports = AdminController;
