const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Coupon = sequelize.define(
  'Coupon',
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    code: {
      type: DataTypes.STRING(50),
      unique: true,
      allowNull: false,
      validate: {
        notEmpty: true,
      },
    },
    description: {
      type: DataTypes.TEXT,
    },
    discount_type: {
      type: DataTypes.ENUM('Percentage', 'FreeShipping'),
      allowNull: false,
    },
    discount_value: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false,
      validate: {
        min: 0,
      },
    },
    start_date: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    end_date: {
      type: DataTypes.DATE,
      allowNull: false,
      validate: {
        isAfterStartDate(value) {
          if (this.start_date && value <= this.start_date) {
            throw new Error('End date must be after start date.');
          }
        },
      },
    },
    is_active: {
      type: DataTypes.BOOLEAN,
      defaultValue: true,
    },
    product_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'Products',
        key: 'id',
      },
    },
  },
  {
    timestamps: true,
    tableName: 'Coupons',

    hooks: {
      beforeUpdate: coupon => {
        const now = new Date();
        if (coupon.end_date && coupon.end_date < now) {
          coupon.is_active = false;
        }
      },

      afterCreate: coupon => {
        console.log(`Coupon created: Code ${coupon.code}, Discount Type: ${coupon.discount_type}`);
      },

      afterUpdate: coupon => {
        console.log(`Coupon updated: Code ${coupon.code}, Active: ${coupon.is_active}`);
      },
    },
  }
);

module.exports = Coupon;
