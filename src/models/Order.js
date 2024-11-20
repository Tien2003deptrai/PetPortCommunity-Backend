const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Order = sequelize.define(
  'Order',
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    petOwner_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'Users',
        key: 'id',
      },
    },
    total_amount: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false,
      validate: {
        isDecimal: true,
        min: 0,
      },
    },
    status: {
      type: DataTypes.ENUM(
        'Đang xử lý',
        'Chờ thanh toán',
        'Hoàn thành',
        'Hủy',
        'Đã giao',
        'Đang vận chuyển'
      ),
      defaultValue: 'Đang xử lý',
    },
  },
  {
    timestamps: true,
    tableName: 'Orders',

    hooks: {
      beforeCreate: order => {
        if (order.total_amount <= 0) {
          throw new Error('Total amount must be greater than zero.');
        }
      },

      beforeUpdate: order => {
        if (order.status === 'Hoàn thành' || order.status === 'Hủy') {
          throw new Error('Cannot update an order that is completed or canceled.');
        }
      },

      afterCreate: order => {
        console.log(`Order created: ID ${order.id} - Status: ${order.status}`);
      },

      afterUpdate: order => {
        console.log(`Order updated: ID ${order.id} - New Status: ${order.status}`);
      },
    },
  }
);

module.exports = Order;
