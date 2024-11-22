const orderService = require('~/service/OrderService');

const OrderController = {
  async createOrderProduct(req, res, next) {
    try {
      const result = await orderService.createOrderProduct(req.body);
      res.status(201).json({ success: true, ...result });
    } catch (error) {
      next(error);
    }
  },

  async getAll(req, res, next) {
    try {
      // Lấy dữ liệu từ Service
      const result = await orderService.getAllOrders(req.query);

      // Trả về response bao gồm số trang
      res.status(200).json({
        success: true,
        data: result.data,
        totalRecords: result.totalRecords,
        totalPages: result.totalPages,
        currentPage: result.currentPage,
      });
    } catch (error) {
      next(error); // Chuyển lỗi đến middleware xử lý
    }
  },

  async getById(req, res, next) {
    try {
      const order = await orderService.getOrderById(req.params.id);
      res.status(200).json({ success: true, data: order });
    } catch (error) {
      next(error);
    }
  },

  async update(req, res, next) {
    try {
      const updatedOrder = await orderService.updateOrder(req.params.id, req.body);
      res.status(200).json({ success: true, data: updatedOrder });
    } catch (error) {
      next(error);
    }
  },

  async delete(req, res, next) {
    try {
      await orderService.deleteOrder(req.params.id);
      res.status(200).json({ success: true, message: 'Delete successfully' });
    } catch (error) {
      next(error);
    }
  },

  async getTotalOrders(req, res, next) {
    try {
      const totalOrders = await orderService.getTotalOrders();
      res.status(200).json({ success: true, totalOrders });
    } catch (error) {
      next(error);
    }
  },

  async getOrdersByPetOwner(req, res, next) {
    try {
      const orders = await orderService.getOrdersByPetOwner(req.params.petOwner_id);
      res.status(200).json({ success: true, data: orders });
    } catch (error) {
      next(error);
    }
  },

  async calculateTotalRevenue(req, res, next) {
    try {
      const totalRevenue = await orderService.calculateTotalRevenue();
      res.status(200).json({ success: true, data: totalRevenue });
    } catch (error) {
      next(error);
    }
  },
};

module.exports = OrderController;
