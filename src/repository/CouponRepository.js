const { Coupon, Product, Op } = require('~/models');

class CouponRepository {
  async createCoupon(data) {
    return Coupon.create(data);
  }

  async findAllCoupons(options) {
    return Coupon.findAll({
      include: [
        {
          model: Product,
          as: 'CouponProduct',
          attributes: ['id', 'name', 'description'],
        },
      ],
      ...options,
    });
  }

  async findCouponById(id) {
    return Coupon.findByPk(id, {
      include: [
        {
          model: Product,
          as: 'CouponProduct',
          attributes: ['id', 'name', 'description'],
        },
      ],
    });
  }

  async updateCouponById(id, data) {
    return Coupon.update(data, { where: { id } });
  }

  async deleteCouponById(id) {
    return Coupon.destroy({ where: { id } });
  }

  async findActiveCoupons(currentDate) {
    return Coupon.findAll({
      where: {
        start_date: { [Op.lte]: currentDate },
        end_date: { [Op.gte]: currentDate },
        is_active: true,
      },
      include: [
        {
          model: Product,
          as: 'CouponProduct',
          attributes: ['id', 'name', 'description'],
        },
      ],
    });
  }

  async findCouponByCode(code, currentDate) {
    return Coupon.findOne({
      where: {
        code,
        start_date: { [Op.lte]: currentDate },
        end_date: { [Op.gte]: currentDate },
      },
      include: [
        {
          model: Product,
          as: 'CouponProduct',
          attributes: ['id', 'name', 'description'],
        },
      ],
    });
  }

  async findCouponsByDiscountType(discount_type) {
    return Coupon.findAll({
      where: { discount_type },
      include: [
        {
          model: Product,
          as: 'CouponProduct',
          attributes: ['id', 'name', 'description'],
        },
      ],
    });
  }
}

module.exports = new CouponRepository();
