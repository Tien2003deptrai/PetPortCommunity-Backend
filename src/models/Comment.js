const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Comment = sequelize.define(
  'Comment',
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    post_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'Posts', // Liên kết tới bảng Posts
        key: 'id',
      },
    },
    petOwner_Id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'Users', // Liên kết tới bảng Users
        key: 'id',
      },
    },
    content: {
      type: DataTypes.TEXT,
      allowNull: false,
      validate: {
        notEmpty: true,
        len: [1, 1000], // Nội dung phải có độ dài từ 1 đến 1000 ký tự
      },
    },
  },
  {
    timestamps: true,
    tableName: 'Comments',
    indexes: [
      {
        fields: ['post_id'], // Index giúp truy vấn nhanh theo bài viết
        name: 'idx_post_id',
      },
      {
        fields: ['petOwner_Id'], // Index giúp truy vấn nhanh theo người dùng
        name: 'idx_petOwner_id',
      },
    ],

    hooks: {
      beforeCreate: comment => {
        comment.content = comment.content.trim();
      },

      beforeUpdate: comment => {
        comment.content = comment.content.trim();
      },

      afterCreate: comment => {
        console.log(`Comment created: ID ${comment.id}, Post ID: ${comment.post_id}`);
      },

      afterUpdate: comment => {
        console.log(`Comment updated: ID ${comment.id}, Post ID: ${comment.post_id}`);
      },
    },
  }
);

module.exports = Comment;
