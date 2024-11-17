const couponService = require('~/service/CouponService');

const CouponController = {
  async create(req, res, next) {
    try {
      const coupon = await couponService.createCoupon(req.body);
      res.status(200).json({ success: true, data: coupon });
    } catch (error) {
      next(error);
    }
  },

  async getAll(req, res, next) {
    try {
      const coupons = await couponService.getAllCoupons();
      res.status(200).json({ success: true, data: coupons });
    } catch (error) {
      next(error);
    }
  },

  async getById(req, res, next) {
    try {
      const coupon = await couponService.getCouponById(req.params.id);
      res.status(200).json({ success: true, data: coupon });
    } catch (error) {
      next(error);
    }
  },

  async update(req, res, next) {
    try {
      const updatedCoupon = await couponService.updateCoupon(req.params.id, req.body);
      res.status(200).json({ success: true, data: updatedCoupon });
    } catch (error) {
      next(error);
    }
  },

  async delete(req, res, next) {
    try {
      await couponService.deleteCoupon(req.params.id);
      res.status(200).json({ success: true, message: 'Delete successfully' });
    } catch (error) {
      next(error);
    }
  },

  async getActiveCoupons(req, res, next) {
    try {
      const coupons = await couponService.getActiveCoupons();
      res.status(200).json({ success: true, data: coupons });
    } catch (error) {
      next(error);
    }
  },

  async checkCoupon(req, res, next) {
    try {
      const coupon = await couponService.checkCouponValidity(req.params.code);
      res.status(200).json({ success: true, data: coupon });
    } catch (error) {
      next(error);
    }
  },

  async getCouponsByDiscountType(req, res, next) {
    try {
      const coupons = await couponService.getCouponsByDiscountType(req.params.discount_type);
      res.status(200).json({ success: true, data: coupons });
    } catch (error) {
      next(error);
    }
  },
};

module.exports = CouponController;
