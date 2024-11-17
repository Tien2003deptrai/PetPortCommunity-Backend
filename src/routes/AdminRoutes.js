const express = require('express');
const { AdminController } = require('~/controllers');
const router = express.Router();

router.post('/avatar', AdminController.updateAvatar);

router.post('/upgrade-to-doctor', AdminController.upgradeToDoctor);

router.post('/approve-doctor/:userId', AdminController.approveDoctor);

router.post('/upgrade-to-seller', AdminController.upgradeToSeller);

router.post('/approve-seller/:userId', AdminController.approveSeller);

module.exports = router;
