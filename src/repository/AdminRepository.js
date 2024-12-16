const { User, Op, sequelize } = require('~/models');

const AdminRepository = {
  async findUserById(userId) {
    return await User.findByPk(userId);
  },

  async deleteUserById(userId) {
    const user = await this.findUserById(userId);
    if (!user) return null;
    await user.destroy();
    return user;
  },

  async updateUser(userId, data) {
    const user = await this.findUserById(userId);
    if (!user) return null;
    await user.update(data);
    return user;
  },

  async findPendingDoctors() {
    return await User.findAll({
      where: {
        is_doctor_approved: false,
        [Op.and]: [sequelize.literal(`JSON_CONTAINS(role, '"PetOwner"')`)],
        clinic_address: { [Op.ne]: null },
        practice_certificate: { [Op.ne]: null },
      },
      attributes: [
        'id',
        'full_name',
        'email',
        'clinic_address',
        'experience_years',
        'practice_certificate',
        'opening_time',
        'closing_time',
        'doctor_avatar',
        'certificate_image',
        'is_doctor_approved',
      ],
    });
  },

  async findRegisteredDoctors() {
    return await User.findAll({
      where: {
        is_doctor_approved: true,
        [Op.and]: [sequelize.literal(`JSON_CONTAINS(role, '"PetOwner"')`)],
        clinic_address: { [Op.ne]: null },
        practice_certificate: { [Op.ne]: null },
      },
      attributes: [
        'id',
        'full_name',
        'email',
        'clinic_address',
        'experience_years',
        'practice_certificate',
        'opening_time',
        'closing_time',
        'doctor_avatar',
        'certificate_image',
        'is_doctor_approved',
      ],
    });
  },

  async findPendingSellers() {
    return await User.findAll({
      where: {
        is_store_verified: false,
        [Op.and]: [sequelize.literal(`JSON_CONTAINS(role, '"PetOwner"')`)],
        store_name: { [Op.ne]: null },
        business_license: { [Op.ne]: null },
      },
      attributes: [
        'id',
        'full_name',
        'email',
        'store_name',
        'business_license',
        'store_logo',
        'business_license_url',
        'store_description',
        'store_address',
        'is_store_verified',
      ],
    });
  },

  async findRegisteredSellers() {
    return await User.findAll({
      where: {
        is_store_verified: true,
        [Op.and]: [sequelize.literal(`JSON_CONTAINS(role, '"PetOwner"')`)],
        store_name: { [Op.ne]: null },
        business_license: { [Op.ne]: null },
      },
      attributes: [
        'id',
        'full_name',
        'email',
        'store_name',
        'business_license',
        'store_logo',
        'business_license_url',
        'store_description',
        'store_address',
        'is_store_verified',
      ],
    });
  },
};

module.exports = AdminRepository;
