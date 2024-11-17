const { Payment, Order, OrderItem, Product, Op } = require('~/models');

class PaymentRepository {
  async createPayment(data) {
    return Payment.create(data);
  }

  async findPaymentById(id) {
    return Payment.findByPk(id);
  }

  async findPaymentsByOrderId(orderId) {
    return Payment.findAll({ where: { order_id: orderId } });
  }

  async findPaymentsByStatus(status) {
    return Payment.findAll({ where: { status } });
  }

  async findPaymentsInDateRange(startDate, endDate) {
    return Payment.findAll({
      where: { payment_date: { [Op.between]: [new Date(startDate), new Date(endDate)] } },
    });
  }

  async updatePaymentStatus(transactionId, status) {
    return Payment.update({ status }, { where: { transaction_id: transactionId } });
  }

  async deletePaymentById(id) {
    return Payment.destroy({ where: { id } });
  }

  async getTotalPayments() {
    return Payment.sum('amount');
  }

  async findOrderWithItems(orderId) {
    return Order.findByPk(orderId, {
      include: [
        {
          model: OrderItem,
          as: 'OrderItems',
          include: [{ model: Product, as: 'Product', attributes: ['name'] }],
        },
      ],
    });
  }
}

module.exports = new PaymentRepository();
