const orderRepo = require('~/repository/OrderRepository');
const sequelize = require('~/models').sequelize;

class OrderService {
  async createOrderProduct({ petOwner_id, items }) {
    const totalAmount = items.reduce((total, item) => total + item.price * item.quantity, 0);

    const transaction = await sequelize.transaction();
    try {
      const order = await orderRepo.createOrder(
        { petOwner_id, total_amount: totalAmount, status: 'Pending' },
        transaction
      );

      const orderItems = items.map(item => ({
        order_id: order.id,
        product_id: item.productId,
        quantity: item.quantity,
        unit_price: item.price,
        subtotal: item.price * item.quantity,
      }));

      await orderRepo.bulkCreateOrderItems(orderItems, transaction);

      await transaction.commit();
      return { orderId: order.id, totalAmount };
    } catch (error) {
      await transaction.rollback();
      throw new Error(error.message);
    }
  }

  async getAllOrders(query) {
    const { page = 1, limit = 10 } = query;
    const offset = (page - 1) * limit;

    return orderRepo.findAllOrders({ limit, offset });
  }

  async getOrderById(id) {
    const order = await orderRepo.findOrderById(id);
    if (!order) throw new Error('Order not found');
    return order;
  }

  async updateOrder(id, data) {
    const [updated] = await orderRepo.updateOrderById(id, data);
    if (!updated) throw new Error('Order not found');
    return orderRepo.findOrderById(id);
  }

  async deleteOrder(id) {
    const deleted = await orderRepo.deleteOrderById(id);
    if (!deleted) throw new Error('Order not found');
  }

  async getTotalOrders() {
    return orderRepo.countTotalOrders();
  }

  async getOrdersByPetOwner(petOwner_id) {
    return orderRepo.findOrdersByPetOwner(petOwner_id);
  }

  async calculateTotalRevenue() {
    return orderRepo.calculateTotalRevenue();
  }
}

module.exports = new OrderService();
