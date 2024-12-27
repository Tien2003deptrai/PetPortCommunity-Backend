const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Order = require('./Order');

const Payment = sequelize.define(
  'Payment',
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
    amount: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false,
      validate: {
        isDecimal: true,
        min: 0, // Số tiền không được âm
      },
    },
    payment_method: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    status: {
      type: DataTypes.ENUM(
        'Đang xử lý',
        'Hoàn thành',
        'Hủy',
        'Chờ xác nhận',
        'Chờ xử lý',
        'Chờ thanh toán'
      ),
      defaultValue: 'Đang xử lý',
    },
    transaction_id: {
      type: DataTypes.STRING(100),
      unique: true, // Đảm bảo không có trùng lặp giao dịch
      allowNull: true,
    },
    payment_date: {
      type: DataTypes.DATE,
      allowNull: true,
    },
  },
  {
    timestamps: true,
    tableName: 'Payments',

    hooks: {
      // Xác định trạng thái thanh toán trước khi tạo
      beforeCreate: async payment => {
        if (!payment.transaction_id) {
          payment.transaction_id = `TRANS-${Date.now()}`;
        }

        if (!payment.payment_date) {
          payment.payment_date = new Date();
        }
      },

      // Kiểm tra logic trước khi cập nhật trạng thái
      beforeUpdate: async payment => {
        if (payment.changed('status') && payment.status === 'Hoàn thành') {
          payment.payment_date = new Date();
        }
      },

      // Cập nhật trạng thái đơn hàng khi thanh toán hoàn thành
      afterUpdate: async payment => {
        if (payment.status === 'Hoàn thành') {
          const order = await Order.findByPk(payment.order_id);
          if (order) {
            order.status = 'Hoàn thành';
            await order.save();
            console.log(`Order ID ${order.id} marked as completed after payment.`);
          }
        }
      },

      // Log sau khi thanh toán được tạo
      afterCreate: payment => {
        console.log(
          `Payment created: ID ${payment.id}, Amount ${payment.amount}, Method ${payment.payment_method}`
        );
      },
    },
  }
);

module.exports = Payment;
