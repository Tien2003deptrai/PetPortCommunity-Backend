const orderRepo = require('~/repository/OrderRepository');
const productRepo = require('~/repository/ProductRepository');
const sequelize = require('~/models').sequelize;

class OrderService {
  async createOrderProduct({ petOwner_id, items }) {
    const transaction = await sequelize.transaction();

    try {
      let totalAmount = 0;

      const orderItems = await Promise.all(
        items.map(async item => {
          const product = await productRepo.findById(item.productId);
          if (!product) {
            throw new Error(`Product with ID ${item.productId} not found.`);
          }

          if (product.stock_quantity < item.quantity) {
            throw new Error(`Insufficient stock for product: ${product.name}`);
          }

          const unitPrice = product.price;
          const subtotal = unitPrice * item.quantity;
          totalAmount += subtotal;

          return {
            order_id: null,
            product_id: item.productId,
            quantity: item.quantity,
            unit_price: unitPrice,
            subtotal,
          };
        })
      );

      console.log('Prepared Order Items:', orderItems);

      const order = await orderRepo.createOrder(
        { petOwner_id, total_amount: totalAmount, status: 'Đang xử lý' },
        transaction
      );

      console.log('Order created successfully:', order);

      orderItems.forEach(item => {
        item.order_id = order.id;
      });

      await orderRepo.bulkCreateOrderItems(orderItems, transaction);
      console.log('Order Items created successfully');

      await Promise.all(
        items.map(async item => {
          try {
            await productRepo.updateStock(item.productId, -item.quantity, transaction);
          } catch (error) {
            console.error(`Failed to update stock for product ${item.productId}:`, error.message);
            throw error;
          }
        })
      );

      console.log('Product stock updated successfully');

      await transaction.commit();

      return { orderId: order.id, totalAmount };
    } catch (error) {
      console.error('Transaction failed:', error.message);
      await transaction.rollback();
      throw new Error(error.message);
    }
  }

  async getAllOrders(query) {
    const { page = 1, limit = 10 } = query;

    const offset = (page - 1) * limit;

    const result = await orderRepo.findAllOrders({
      limit: parseInt(limit, 10),
      offset: parseInt(offset, 10),
    });

    const totalPages = Math.ceil(result.count / limit);

    return {
      totalRecords: result.count,
      totalPages,
      currentPage: parseInt(page, 10),
      data: result.rows,
    };
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
