const { Order, OrderItem, Product, Op } = require('~/models');

class OrderRepository {
  async createOrder(data, transaction) {
    return Order.create(data, { transaction });
  }

  async bulkCreateOrderItems(items, transaction) {
    return OrderItem.bulkCreate(items, { transaction });
  }

  async findAllOrders(options) {
    return Order.findAndCountAll({
      include: [
        {
          model: OrderItem,
          as: 'OrderItems',
          include: [
            {
              model: Product,
              as: 'Product',
              attributes: ['name', 'price'],
            },
          ],
        },
      ],
      ...options,
    });
  }

  async findOrderById(id) {
    return Order.findByPk(id, {
      include: [
        {
          model: OrderItem,
          as: 'OrderItems',
          include: [
            {
              model: Product,
              as: 'Product',
              attributes: ['name', 'price'],
            },
          ],
        },
      ],
    });
  }

  async updateOrderById(id, data) {
    return Order.update(data, { where: { id } });
  }

  async deleteOrderById(id) {
    return Order.destroy({ where: { id } });
  }

  async countTotalOrders() {
    return Order.count();
  }

  async findOrdersByPetOwner(petOwner_id) {
    return Order.findAll({
      where: { petOwner_id },
      include: [
        {
          model: OrderItem,
          as: 'OrderItems',
          include: [
            {
              model: Product,
              as: 'Product',
              attributes: ['name', 'price'],
            },
          ],
        },
      ],
    });
  }

  async findOrdersByStatus(status) {
    return Order.findAll({
      where: { status },
      include: [
        {
          model: OrderItem,
          as: 'OrderItems',
          include: [
            {
              model: Product,
              as: 'Product',
              attributes: ['name', 'price'],
            },
          ],
        },
      ],
    });
  }

  async calculateTotalRevenue() {
    return Order.sum('total_amount');
  }
}

module.exports = new OrderRepository();
