const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Product = require('./Product');

const OrderItem = sequelize.define(
  'OrderItem',
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    order_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'Orders',
        key: 'id',
      },
    },
    product_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'Products',
        key: 'id',
      },
    },
    quantity: {
      type: DataTypes.INTEGER,
      defaultValue: 1,
      validate: {
        min: 1, // Số lượng không được nhỏ hơn 1
      },
    },
    unit_price: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false,
      validate: {
        isDecimal: true,
        min: 0, // Giá không được âm
      },
    },
    subtotal: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false,
      validate: {
        isDecimal: true,
        min: 0, // Tổng tiền không được âm
      },
    },
  },
  {
    timestamps: true,
    tableName: 'OrderItems',

    hooks: {
      // Tự động tính toán subtotal trước khi tạo
      beforeCreate: async orderItem => {
        if (!orderItem.unit_price || !orderItem.quantity) {
          throw new Error('Unit price and quantity are required to calculate subtotal.');
        }
        orderItem.subtotal = orderItem.unit_price * orderItem.quantity;
      },

      // Tự động tính toán subtotal trước khi cập nhật
      beforeUpdate: async orderItem => {
        if (orderItem.changed('unit_price') || orderItem.changed('quantity')) {
          if (!orderItem.unit_price || !orderItem.quantity) {
            throw new Error('Unit price and quantity are required to calculate subtotal.');
          }
          orderItem.subtotal = orderItem.unit_price * orderItem.quantity;
        }
      },

      // Log thông tin sau khi tạo
      afterCreate: orderItem => {
        console.log(
          `OrderItem created: Order ID ${orderItem.order_id}, Product ID ${orderItem.product_id}, Quantity ${orderItem.quantity}, Subtotal ${orderItem.subtotal}`
        );
      },
    },
  }
);

module.exports = OrderItem;
