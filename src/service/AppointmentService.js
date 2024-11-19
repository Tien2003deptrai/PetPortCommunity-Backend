const appointmentRepo = require('~/repository/AppointmentRepository');

class AppointmentService {
  async createAppointment(data) {
    const { doctor_id, appointment_date } = data;
    const startDate = new Date(appointment_date);
    const endDate = new Date(startDate.getTime() + 60 * 60 * 1000); // 1 giờ

    const conflict = await appointmentRepo.checkAppointmentConflict(doctor_id, startDate, endDate);
    if (conflict.length > 0) {
      throw new Error('Xung đột với các cuộc hẹn hiện có');
    }

    return appointmentRepo.createAppointment(data);
  }

  async getAllAppointments(query) {
    const options = {
      order: [['appointment_date', 'ASC']],
    };
    return appointmentRepo.findAllAppointments(options);
  }

  async getAppointmentById(id) {
    const appointment = await appointmentRepo.findAppointmentById(id);
    if (!appointment) {
      throw new Error('Không tìm thấy cuộc hẹn');
    }
    return appointment;
  }

  async updateAppointment(id, data) {
    const updated = await appointmentRepo.updateAppointmentById(id, data);
    if (!updated[0]) {
      throw new Error('Không tìm thấy cuộc hẹn');
    }
    return appointmentRepo.findAppointmentById(id);
  }

  async deleteAppointment(id) {
    const deleted = await appointmentRepo.deleteAppointmentById(id);
    if (!deleted) {
      throw new Error('Không tìm thấy cuộc hẹn');
    }
  }

  async getAppointmentsByPetOwner(petOwnerId) {
    const options = { order: [['appointment_date', 'ASC']] };
    return appointmentRepo.findAppointmentsByPetOwner(petOwnerId, options);
  }

  async getAppointmentsByDoctor(doctorId) {
    const options = { order: [['appointment_date', 'ASC']] };
    return appointmentRepo.findAppointmentsByDoctor(doctorId, options);
  }

  async getAppointmentsByStatus(status) {
    const options = { order: [['appointment_date', 'ASC']] };
    return appointmentRepo.findAppointmentsByStatus(status, options);
  }
}

module.exports = new AppointmentService();
