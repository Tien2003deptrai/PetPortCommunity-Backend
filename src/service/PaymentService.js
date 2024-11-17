const { Order, Payment } = require('~/models');
const paymentRepo = require('~/repository/PaymentRepository');
const stripe = require('stripe')(process.env.STRIPE_PRIVATE_KEY);

class PaymentService {
  async createPayment(orderId) {
    const successUrl = `${process.env.BASE_URL}/shop`;
    const cancelUrl = `${process.env.BASE_URL}/cancel`;

    if (!/^https?:\/\//.test(successUrl) || !/^https?:\/\//.test(cancelUrl)) {
      throw new Error('Invalid BASE_URL configuration.');
    }

    const order = await paymentRepo.findOrderWithItems(orderId);
    if (!order) throw new Error('Order not found');

    const session = await stripe.checkout.sessions.create({
      payment_method_types: ['card'],
      mode: 'payment',
      line_items: order.OrderItems.map(item => ({
        price_data: {
          currency: 'usd',
          product_data: { name: item.Product.name },
          unit_amount: Math.round(item.unit_price * 100),
        },
        quantity: item.quantity,
      })),
      success_url: successUrl,
      cancel_url: cancelUrl,
    });

    await paymentRepo.createPayment({
      order_id: orderId,
      amount: order.total_amount,
      payment_method: 'Credit Card',
      status: 'Pending',
      transaction_id: session.id,
      payment_date: new Date(),
    });

    return { id: session.id, url: session.url };
  }

  async updatePaymentStatus(paymentIntentId, status, orderId) {
    const updated = await paymentRepo.updatePaymentStatus(paymentIntentId, status);
    if (!updated[0]) throw new Error('Payment not found');
    await Order.update({ status: 'Completed' }, { where: { id: orderId } });
  }

  async getAllPayments() {
    return Payment.findAll();
  }

  async getPaymentById(id) {
    const payment = await paymentRepo.findPaymentById(id);
    if (!payment) throw new Error('Payment not found');
    return payment;
  }

  async deletePayment(id) {
    const deleted = await paymentRepo.deletePaymentById(id);
    if (!deleted) throw new Error('Payment not found');
  }

  async getTotalPayments() {
    return paymentRepo.getTotalPayments();
  }

  async getPaymentsByOrderId(orderId) {
    return paymentRepo.findPaymentsByOrderId(orderId);
  }

  async getPaymentsByStatus(status) {
    return paymentRepo.findPaymentsByStatus(status);
  }
}

module.exports = new PaymentService();
