const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Category = sequelize.define(
  'Category',
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    name: {
      type: DataTypes.STRING(100),
      allowNull: false,
      validate: {
        notEmpty: true,
      },
    },
    type: {
      type: DataTypes.STRING(100),
      type: DataTypes.ENUM('Thú cưng', 'Dịch vụ', 'Sản phẩm'),
      allowNull: false,
    },
    is_active: {
      type: DataTypes.BOOLEAN,
      defaultValue: true,
    },
  },
  {
    timestamps: true,
    tableName: 'Categories',
    indexes: [
      {
        fields: ['type'],
      },
      {
        fields: ['is_active'],
      },
    ],

    hooks: {
      beforeCreate: category => {
        category.name = category.name
          .trim()
          .replace(/\s+/g, ' ')
          .replace(/^\w/, c => c.toUpperCase());

        category.type = category.type.trim().toLowerCase();
      },
      beforeUpdate: category => {
        category.name = category.name
          .trim()
          .replace(/\s+/g, ' ')
          .replace(/^\w/, c => c.toUpperCase());
        category.type = category.type.trim().toLowerCase();
      },
      afterCreate: category => {
        console.log(`Category created: ${category.name} (${category.type})`);
      },
      afterUpdate: category => {
        console.log(`Category updated: ${category.name} (${category.type})`);
      },
    },
  }
);

module.exports = Category;
