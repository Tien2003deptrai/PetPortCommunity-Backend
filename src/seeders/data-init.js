const path = require('path');
const modelsPath = path.resolve(__dirname, '../models');
const {
  User,
  sequelize,
  Category,
  Pet,
  Product,
  Order,
  OrderItem,
  Payment,
  Post,
  Comment,
  Review,
  Coupon,
  Appointment,
} = require(modelsPath);

const seedUsers = async () => {
  try {
    await sequelize.sync({ force: false }); // Không xóa cấu trúc bảng, chỉ thêm/xóa dữ liệu

    await sequelize.query('SET FOREIGN_KEY_CHECKS = 0;');
    await Appointment.destroy({ where: {}, truncate: true });
    await Pet.destroy({ where: {}, truncate: true });
    await Comment.destroy({ where: {}, truncate: true });
    await Review.destroy({ where: {}, truncate: true });
    await Post.destroy({ where: {}, truncate: true });
    await OrderItem.destroy({ where: {}, truncate: true });
    await Order.destroy({ where: {}, truncate: true });
    await Payment.destroy({ where: {}, truncate: true });
    await Coupon.destroy({ where: {}, truncate: true });
    await Product.destroy({ where: {}, truncate: true });
    await Category.destroy({ where: {}, truncate: true });
    await User.destroy({ where: {}, truncate: true });

    await sequelize.query('SET FOREIGN_KEY_CHECKS = 1;');
    console.log('All existing data in Users ..... table has been deleted.');

    // Seed dữ liệu mới
    const users = [
      {
        username: 'doctor_user',
        password: 'password123', // Hash password nếu cần
        email: 'doctor@example.com',
        role: ['PetOwner', 'Doctor'],
        full_name: 'Dr. John Doe',
        phone: '0123456789',
        gender: 'Nam',
        date_of_birth: '1980-05-15',
        address: '123 Clinic Street',
        avatar_url: 'https://example.com/avatar_doctor.jpg',
        cccd: '123456789012',
        cccd_front_image: 'https://example.com/cccd_front.jpg',
        cccd_back_image: 'https://example.com/cccd_back.jpg',
        clinic_address: '123 Clinic Street',
        practice_certificate: 'CERT-2023-001',
        experience_years: 10,
        opening_time: '08:00',
        closing_time: '17:00',
        doctor_avatar: 'https://example.com/doctor_avatar.jpg',
        certificate_image: 'https://example.com/certificate.jpg',
        is_doctor_approved: false,
      },
      {
        username: 'seller_user',
        password: 'password123', // Hash password nếu cần
        email: 'seller@example.com',
        role: ['PetOwner', 'Seller'],
        full_name: 'Jane Smith',
        phone: '0987654321',
        gender: 'Nữ',
        date_of_birth: '1990-10-20',
        address: '456 Store Avenue',
        avatar_url: 'https://example.com/avatar_seller.jpg',
        store_name: 'Pet Paradise',
        store_address: '456 Store Avenue',
        business_license: 'LICENSE-2023-001',
        store_logo: 'https://example.com/store_logo.jpg',
        business_license_url: 'https://example.com/business_license.jpg',
        store_description: 'A store specializing in pet products and supplies.',
        is_store_verified: false,
      },
      {
        username: 'doctor_user111',
        password: 'password123', // Hash password nếu cần
        email: 'doctor1@example.com',
        role: ['PetOwner', 'Doctor'],
        full_name: 'Dr. Nam',
        phone: '0123456789',
        gender: 'Nam',
        date_of_birth: '1980-05-15',
        address: '123 Clinic Street',
        avatar_url: 'https://example.com/avatar_doctor.jpg',
        cccd: '123456789012',
        cccd_front_image: 'https://example.com/cccd_front.jpg',
        cccd_back_image: 'https://example.com/cccd_back.jpg',
        clinic_address: '123 Clinic Street',
        practice_certificate: 'CERT-2023-001',
        experience_years: 10,
        opening_time: '08:00',
        closing_time: '17:00',
        doctor_avatar: 'https://example.com/doctor_avatar.jpg',
        certificate_image: 'https://example.com/certificate.jpg',
        is_doctor_approved: true,
      },
      {
        username: 'seller_user111',
        password: 'password123', // Hash password nếu cần
        email: 'seller1@example.com',
        role: ['PetOwner', 'Seller'],
        full_name: 'Jane Dao',
        phone: '0987654321',
        gender: 'Nữ',
        date_of_birth: '1990-10-20',
        address: '456 Store Avenue',
        avatar_url: 'https://example.com/avatar_seller.jpg',
        store_name: 'Pet Paradise',
        store_address: '456 Store Avenue',
        business_license: 'LICENSE-2023-001',
        store_logo: 'https://example.com/store_logo.jpg',
        business_license_url: 'https://example.com/business_license.jpg',
        store_description: 'A store specializing in pet products and supplies.',
        is_store_verified: true,
      },
      {
        username: 'admin_user',
        password: 'password123', // Hash password nếu cần
        email: 'admin@example.com',
        role: ['PetOwner', 'Admin'],
        full_name: 'Admin User',
        phone: '0111222333',
        gender: 'Khác',
        date_of_birth: '1985-01-01',
        address: '789 Admin Road',
        avatar_url: 'https://example.com/avatar_admin.jpg',
        is_active: true,
        is_verified: true,
      },
    ];

    for (const userData of users) {
      const user = await User.create(userData);
      console.log(`User created: ${user.username} with roles: ${user.role}`);
    }

    console.log('All seed data created successfully!');
  } catch (error) {
    console.error('Error seeding users:', error);
  } finally {
    await sequelize.close();
  }
};

// Run the seed script
seedUsers();
