const couponRepo = require('~/repository/CouponRepository');

class CouponService {
  async createCoupon(data) {
    return couponRepo.createCoupon(data);
  }

  async getAllCoupons() {
    return couponRepo.findAllCoupons({});
  }

  async getCouponById(id) {
    const coupon = await couponRepo.findCouponById(id);
    if (!coupon) {
      throw new Error('Coupon not found');
    }
    return coupon;
  }

  async updateCoupon(id, data) {
    const [updated] = await couponRepo.updateCouponById(id, data);
    if (!updated) {
      throw new Error('Coupon not found');
    }
    return couponRepo.findCouponById(id);
  }

  async deleteCoupon(id) {
    const deleted = await couponRepo.deleteCouponById(id);
    if (!deleted) {
      throw new Error('Coupon not found');
    }
  }

  async getActiveCoupons() {
    const currentDate = new Date();
    return couponRepo.findActiveCoupons(currentDate);
  }

  async checkCouponValidity(code) {
    const currentDate = new Date();
    const coupon = await couponRepo.findCouponByCode(code, currentDate);
    if (!coupon) {
      throw new Error('Coupon is not valid or has expired');
    }
    return coupon;
  }

  async getCouponsByDiscountType(discount_type) {
    return couponRepo.findCouponsByDiscountType(discount_type);
  }
}

module.exports = new CouponService();
