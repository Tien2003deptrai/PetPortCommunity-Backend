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
  }
);

module.exports = Order;
