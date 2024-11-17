const { Appointment, Pet, User, Category, Op } = require('~/models');

class AppointmentRepository {
  async findAppointmentsByDoctorAndDate(doctorId, startDate, endDate) {
    return Appointment.findAll({
      where: {
        doctor_id: doctorId,
        appointment_date: {
          [Op.between]: [startDate, endDate],
        },
      },
    });
  }

  async findAllAppointments(options) {
    return Appointment.findAll({
      include: [
        {
          model: Pet,
          as: 'Pet',
          include: [
            { model: User, as: 'PetOwner', attributes: ['id', 'username', 'full_name', 'email'] },
            { model: Category, as: 'Category', attributes: ['id', 'name', 'type'] },
          ],
        },
        { model: User, as: 'Doctor', attributes: ['id', 'username', 'full_name', 'email'] },
      ],
      ...options,
    });
  }

  async findAppointmentById(id) {
    return Appointment.findByPk(id, {
      include: [
        {
          model: Pet,
          as: 'Pet',
          include: [
            { model: User, as: 'PetOwner', attributes: ['id', 'username', 'full_name', 'email'] },
            { model: Category, as: 'Category', attributes: ['id', 'name', 'type'] },
          ],
        },
        { model: User, as: 'Doctor', attributes: ['id', 'username', 'full_name', 'email'] },
      ],
    });
  }

  async createAppointment(data) {
    return Appointment.create(data);
  }

  async updateAppointmentById(id, data) {
    return Appointment.update(data, { where: { id } });
  }

  async deleteAppointmentById(id) {
    return Appointment.destroy({ where: { id } });
  }

  async findAppointmentsByStatus(status, options) {
    return Appointment.findAll({
      where: { status },
      ...options,
    });
  }

  async findAppointmentsByPetOwner(petOwnerId, options) {
    return Appointment.findAll({
      where: { pet_owner_id: petOwnerId },
      ...options,
    });
  }

  async findAppointmentsByDoctor(doctorId, options) {
    return Appointment.findAll({
      where: { doctor_id: doctorId },
      ...options,
    });
  }

  async checkAppointmentConflict(doctorId, startDate, endDate) {
    return Appointment.findAll({
      where: {
        doctor_id: doctorId,
        appointment_date: {
          [Op.lt]: endDate,
          [Op.gte]: startDate,
        },
      },
    });
  }
}

module.exports = new AppointmentRepository();
