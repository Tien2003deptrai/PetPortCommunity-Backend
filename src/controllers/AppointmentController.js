const appointmentService = require('~/service/AppointmentService');

const AppointmentController = {
  async create(req, res, next) {
    try {
      const appointment = await appointmentService.createAppointment(req.body);
      res.status(201).json({ success: true, data: appointment });
    } catch (error) {
      next(error);
    }
  },

  async getAll(req, res, next) {
    try {
      const appointments = await appointmentService.getAllAppointments(req.query);
      res.status(200).json({ success: true, data: appointments });
    } catch (error) {
      next(error);
    }
  },

  async getById(req, res, next) {
    try {
      const appointment = await appointmentService.getAppointmentById(req.params.id);
      res.status(200).json({ success: true, data: appointment });
    } catch (error) {
      next(error);
    }
  },

  async update(req, res, next) {
    try {
      const updatedAppointment = await appointmentService.updateAppointment(
        req.params.id,
        req.body
      );
      res.status(200).json({ success: true, data: updatedAppointment });
    } catch (error) {
      next(error);
    }
  },

  async delete(req, res, next) {
    try {
      await appointmentService.deleteAppointment(req.params.id);
      res.status(200).json({ success: true, message: 'Delete successfully' });
    } catch (error) {
      next(error);
    }
  },

  async getByPetOwner(req, res, next) {
    try {
      const appointments = await appointmentService.getAppointmentsByPetOwner(
        req.params.pet_owner_id
      );
      res.status(200).json({ success: true, data: appointments });
    } catch (error) {
      next(error);
    }
  },

  async getByDoctor(req, res, next) {
    try {
      const appointments = await appointmentService.getAppointmentsByDoctor(req.params.doctor_id);
      res.status(200).json({ success: true, data: appointments });
    } catch (error) {
      next(error);
    }
  },

  async getByStatus(req, res, next) {
    try {
      const appointments = await appointmentService.getAppointmentsByStatus(req.params.status);
      res.status(200).json({ success: true, data: appointments });
    } catch (error) {
      next(error);
    }
  },

  async checkConflict(req, res, next) {
    try {
      const conflict = await appointmentService.checkAppointmentConflict(req.body);
      res.status(200).json({ success: true, data: conflict });
    } catch (error) {
      next(error);
    }
  },
};

module.exports = AppointmentController;
