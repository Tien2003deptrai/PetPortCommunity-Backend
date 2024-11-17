const { Sequelize } = require('sequelize');
require('dotenv').config();

const sequelize = new Sequelize(process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASSWORD, {
  host: process.env.DB_HOST,
  dialect: 'mysql',
  // port: 3306,
  logging: false,
  pool: {},
  max: 10, // Tối đa 10 kết nối
  min: 0,
  acquire: 30000,
  idle: 10000,
});

// const sequelize = new Sequelize('aaa11', 'root', 'Tien2003@', {
//   host: 'db',
//   dialect: 'mysql',
//   logging: false,
// });

module.exports = sequelize;
