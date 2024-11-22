const express = require('express');
const { OrderController } = require('~/controllers');
const { validate } = require('~/middlewares');
const { OrderValidation } = require('~/validations');

const router = express.Router();

router.get('/paniagated', OrderController.getAll);

router.post(
  '/products',
  // validate(OrderValidation.createOrderProduct),
  OrderController.createOrderProduct
);

router.get('/total-orders', OrderController.getTotalOrders);

router.get('/total-revenue', OrderController.calculateTotalRevenue);

router.get('/:id', validate(OrderValidation.getById), OrderController.getById);

router.put('/:id', validate(OrderValidation.update), OrderController.update);

router.delete('/:id', validate(OrderValidation.delete), OrderController.delete);

router.get(
  '/pet_owner/:petOwner_id',
  validate(OrderValidation.getOrdersByCustomer),
  OrderController.getOrdersByPetOwner
);

module.exports = router;
