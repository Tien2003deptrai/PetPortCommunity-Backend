const express = require('express');
const { AppointmentController } = require('~/controllers');
const { AppointmentValidation } = require('~/validations');
const { validate } = require('~/middlewares');
const router = express.Router();

router.post('/', validate(AppointmentValidation.create), AppointmentController.create);

router.get('/', AppointmentController.getAll);

router.get('/:id', validate(AppointmentValidation.getById), AppointmentController.getById);

router.put('/:id', validate(AppointmentValidation.update), AppointmentController.update);

router.delete('/:id', validate(AppointmentValidation.delete), AppointmentController.delete);

router.get(
  '/owner/:pet_owner_id',
  validate(AppointmentValidation.getByPetOwner),
  AppointmentController.getByPetOwner
);

router.get(
  '/doctor/:doctor_id',
  validate(AppointmentValidation.getByDoctor),
  AppointmentController.getByDoctor
);

router.post(
  '/check-conflict',
  validate(AppointmentValidation.checkAppointmentConflict),
  AppointmentController.checkConflict
);

module.exports = router;
