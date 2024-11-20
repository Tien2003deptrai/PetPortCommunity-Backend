const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Appointment = sequelize.define(
  'Appointment',
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    pet_owner_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'Users',
        key: 'id',
      },
    },
    pet_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'Pets',
        key: 'id',
      },
    },
    doctor_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'Users',
        key: 'id',
      },
    },
    appointment_date: {
      type: DataTypes.DATE,
      allowNull: false,
      validate: {
        isAfter: new Date().toISOString(),
      },
    },
    appointment_time: {
      type: DataTypes.TIME,
      allowNull: false,
    },
    status: {
      type: DataTypes.ENUM('Đã đặt lịch', 'Đã hoàn thành', 'Đã hủy'),
      defaultValue: 'Đã đặt lịch',
    },
    notes: {
      type: DataTypes.TEXT,
    },
  },
  {
    timestamps: true,
    tableName: 'Appointments',

    hooks: {
      beforeCreate: async appointment => {
        const now = new Date();
        const appointmentDate = new Date(appointment.appointment_date);

        if (appointmentDate < now) {
          throw new Error('Appointment date must be in the future.');
        }
      },

      beforeUpdate: async appointment => {
        if (appointment.status === 'Đã hoàn thành' || appointment.status === 'Đã hủy') {
          throw new Error('Completed or cancelled appointments cannot be modified.');
        }
      },

      afterCreate: appointment => {
        console.log(`Appointment created: ID ${appointment.id}, Status: ${appointment.status}`);
      },
    },
  }
);

module.exports = Appointment;
