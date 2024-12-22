const express = require('express');
const { AdminController } = require('~/controllers');
const router = express.Router();

router.post('/avatar', AdminController.updateAvatar);

// đăng ký
router.post('/upgrade-to-doctor', AdminController.upgradeToDoctor);
// chấp nhập
router.post('/approve-doctor/:userId', AdminController.approveDoctor);
// đăng ký
router.post('/upgrade-to-seller', AdminController.upgradeToSeller);
// chấp nhận
router.post('/approve-seller/:userId', AdminController.approveSeller);

// Lấy danh sách doctor chờ phê duyệt
router.get('/pending-doctors', AdminController.getPendingDoctors);
// Lấy danh sách doctor đã đăng ký
router.get('/registered-doctors', AdminController.getRegisteredDoctors);
// Lấy danh sách Seller chờ phê duyệt
router.get('/pending-sellers', AdminController.getPendingSellers);
// Lấy danh sách Seller đã đăng ký
router.get('/registered-sellers', AdminController.getRegisteredSellers);

router.get('/pet-owners', AdminController.getAllPetOwners);

module.exports = router;
