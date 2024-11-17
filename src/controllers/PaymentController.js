const paymentService = require('~/service/PaymentService');

const PaymentController = {
  async createPayment(req, res, next) {
    try {
      const { orderId } = req.body;
      const result = await paymentService.createPayment(orderId);
      res.status(200).json({ success: true, ...result });
    } catch (error) {
      next(error);
    }
  },

  async updatePaymentStatus(req, res, next) {
    try {
      const { paymentIntentId, status, orderId } = req.body;
      await paymentService.updatePaymentStatus(paymentIntentId, status, orderId);
      res.status(200).json({ success: true, message: 'Payment and order status updated' });
    } catch (error) {
      next(error);
    }
  },

  async getAll(req, res, next) {
    try {
      const payments = await paymentService.getAllPayments();
      res.status(200).json({ success: true, data: payments });
    } catch (error) {
      next(error);
    }
  },

  async getById(req, res, next) {
    try {
      const payment = await paymentService.getPaymentById(req.params.id);
      res.status(200).json({ success: true, data: payment });
    } catch (error) {
      next(error);
    }
  },

  async delete(req, res, next) {
    try {
      await paymentService.deletePayment(req.params.id);
      res.status(200).json({ success: true, message: 'Deleted successfully' });
    } catch (error) {
      next(error);
    }
  },

  async getTotalPayments(req, res, next) {
    try {
      const totalPayments = await paymentService.getTotalPayments();
      res.status(200).json({ success: true, data: totalPayments });
    } catch (error) {
      next(error);
    }
  },

  async getPaymentsByOrderId(req, res, next) {
    try {
      const payments = await paymentService.getPaymentsByOrderId(req.params.orderId);
      res.status(200).json({ success: true, data: payments });
    } catch (error) {
      next(error);
    }
  },

  async getPaymentsByStatus(req, res, next) {
    try {
      const payments = await paymentService.getPaymentsByStatus(req.params.status);
      res.status(200).json({ success: true, data: payments });
    } catch (error) {
      next(error);
    }
  },
};

module.exports = PaymentController;
