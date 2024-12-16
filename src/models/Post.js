const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Post = sequelize.define(
  'Post',
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    petOwner_Id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'Users',
        key: 'id',
      },
    },
    title: {
      type: DataTypes.STRING(255),
      allowNull: false,
      validate: {
        notEmpty: true,
        len: [5, 255], // Tiêu đề phải từ 5 đến 255 ký tự
      },
    },
    content: {
      type: DataTypes.TEXT,
      allowNull: false,
      validate: {
        notEmpty: true,
      },
    },
    image_url: {
      type: DataTypes.STRING(255),
      validate: {
        isUrl: true, // Đảm bảo đường dẫn ảnh là URL hợp lệ
      },
    },
    counterLike: {
      type: DataTypes.INTEGER,
      defaultValue: 0,
      allowNull: false,
      validate: {
        min: 0, // Số lượt thích không được âm
      },
    },
  },
  {
    timestamps: true,
    tableName: 'Posts',

    hooks: {
      beforeCreate: post => {
        post.title = post.title.trim();
        post.content = post.content.trim();
        if (post.image_url) {
          post.image_url = post.image_url;
        }
      },

      beforeUpdate: post => {
        post.title = post.title.trim();
        post.content = post.content.trim();
      },

      afterCreate: post => {
        console.log(`Post created: ID ${post.id}, Title: "${post.title}"`);
      },

      afterUpdate: post => {
        console.log(`Post updated: ID ${post.id}, Title: "${post.title}"`);
      },
    },
  }
);

module.exports = Post;
