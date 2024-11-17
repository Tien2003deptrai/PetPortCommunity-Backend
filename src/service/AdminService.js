const AdminRepository = require('~/repository/AdminRepository');

const AdminService = {
  async deleteUser(userId) {
    const user = await AdminRepository.deleteUserById(userId);
    if (!user) throw new Error('User not found');
    return { message: 'User deleted successfully' };
  },

  async updateAvatar(userId, imageUrl) {
    const user = await AdminRepository.updateUser(userId, { imageUrl });
    if (!user) throw new Error('User not found');
    return {
      message: 'Avatar updated successfully',
      user,
    };
  },

  async upgradeToDoctor(userId, doctorData) {
    const user = await AdminRepository.updateUser(userId, {
      ...doctorData,
      is_doctor_approved: false,
    });
    if (!user) throw new Error('User not found');
    return {
      message: 'Doctor registration request submitted. Awaiting admin approval.',
      user,
    };
  },

  async approveDoctor(userId) {
    const user = await AdminRepository.findUserById(userId);
    if (!user) throw new Error('User not found');
    if (user.is_doctor_approved) throw new Error('User is already approved as Doctor');

    const updatedUser = await AdminRepository.updateUser(userId, {
      role: [...new Set([...user.role, 'Doctor'])],
      is_doctor_approved: true,
    });

    return {
      message: 'User successfully approved as Doctor',
      user: updatedUser,
    };
  },

  async upgradeToSeller(userId, sellerData) {
    const user = await AdminRepository.updateUser(userId, {
      ...sellerData,
      is_store_verified: false,
    });
    if (!user) throw new Error('User not found');
    return {
      message: 'Seller registration request submitted. Awaiting admin approval.',
      user,
    };
  },

  async approveSeller(userId) {
    const user = await AdminRepository.findUserById(userId);
    if (!user) throw new Error('User not found');
    if (user.is_store_verified) throw new Error('User is already approved as Seller');

    const updatedUser = await AdminRepository.updateUser(userId, {
      role: [...new Set([...user.role, 'Seller'])],
      is_store_verified: true,
    });

    return {
      message: 'User successfully approved as Seller',
      user: updatedUser,
    };
  },
};

module.exports = AdminService;
