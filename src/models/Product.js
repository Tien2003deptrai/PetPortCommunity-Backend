const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Product = sequelize.define(
  'Product',
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    sales_center_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'Users',
        key: 'id',
      },
    },
    category_id: {
      type: DataTypes.INTEGER,
      references: {
        model: 'Categories',
        key: 'id',
      },
    },
    name: {
      type: DataTypes.STRING(255),
      allowNull: false,
      validate: {
        notEmpty: true,
      },
    },
    description: {
      type: DataTypes.TEXT,
    },
    price: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false,
      validate: {
        isDecimal: true,
        min: 0,
      },
    },
    stock_quantity: {
      type: DataTypes.INTEGER,
      defaultValue: 0,
      validate: {
        min: 0,
      },
    },
    sku: {
      type: DataTypes.STRING(50),
      allowNull: true,
      unique: true,
    },
    is_active: {
      type: DataTypes.BOOLEAN,
      defaultValue: true,
    },
    images: {
      type: DataTypes.TEXT,
    },
  },
  {
    timestamps: true,
    tableName: 'Products',

    hooks: {
      beforeCreate: product => {
        product.name = product.name
          .trim()
          .replace(/\s+/g, ' ')
          .replace(/^\w/, c => c.toUpperCase());
        product.sku = product.sku || `SKU-${Date.now()}`;
      },
      beforeUpdate: product => {
        product.name = product.name
          .trim()
          .replace(/\s+/g, ' ')
          .replace(/^\w/, c => c.toUpperCase());
      },

      beforeDestroy: product => {
        if (product.stock_quantity > 0) {
          throw new Error('Cannot delete a product with stock remaining.');
        }
      },

      afterCreate: product => {
        console.log(`Product created: ${product.name} (ID: ${product.id})`);
      },
      afterUpdate: product => {
        console.log(`Product updated: ${product.name} (ID: ${product.id})`);
      },
    },
  }
);

module.exports = Product;
