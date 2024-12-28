const express = require('express');
const { AdminController } = require('~/controllers');
const { authorizeRole } = require('~/middlewares');
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
router.get('/pending-doctors', authorizeRole(['Admin']), AdminController.getPendingDoctors);
// Lấy danh sách doctor đã đăng ký
router.get('/registered-doctors', authorizeRole(['Admin']), AdminController.getRegisteredDoctors);
// Lấy danh sách Seller chờ phê duyệt
router.get('/pending-sellers', authorizeRole(['Admin']), AdminController.getPendingSellers);
// Lấy danh sách Seller đã đăng ký
router.get('/registered-sellers', authorizeRole(['Admin']), AdminController.getRegisteredSellers);

router.get('/pet-owners', authorizeRole(['Admin']), AdminController.getAllPetOwners);

module.exports = router;
