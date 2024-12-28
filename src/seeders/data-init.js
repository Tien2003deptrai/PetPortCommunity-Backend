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
        username: 'Bác Sĩ Lãnh',
        password: 'Hashedpassword1@',
        email: 'vananh_doctor@gmail.com',
        role: ['PetOwner', 'Doctor'],
        full_name: 'Nguyễn Văn Anh',
        phone: '0909123456',
        gender: 'Nam',
        date_of_birth: '1980-03-20',
        address: '123 Đường Yên Hòa, Quận 1, TP.HCM',
        avatar_url: 'https://randomuser.me/api/portraits/men/11.jpg',
        cccd: '123456789012',
        cccd_front_image:
          'https://upload.wikimedia.org/wikipedia/commons/a/a2/Stylized_Vietnamese_Citizen_Identity_Card_sample.jpg',
        cccd_back_image:
          'https://upload.wikimedia.org/wikipedia/commons/a/a2/Stylized_Vietnamese_Citizen_Identity_Card_sample.jpg',
        clinic_address: '456 Clinic Avenue',
        practice_certificate: 'CERT-2024-101',
        experience_years: 12,
        opening_time: '08:00',
        closing_time: '17:00',
        doctor_avatar:
          'https://hthaostudio.com/wp-content/uploads/2022/03/Anh-bac-si-nam-7-min.jpg.webp',
        certificate_image:
          'https://c20968e4.rocketcdn.me/wp-content/uploads/2022/10/iau-dba-certificate_image.jpg',
        is_doctor_approved: true,
      },
      {
        username: 'Bán Hàng Huy Hòa',
        password: 'hashedpassword2',
        email: 'huyhoa_seller@gmail.com',
        role: ['PetOwner', 'Seller'],
        full_name: 'Huy Hòa',
        phone: '0908765432',
        gender: 'Nam',
        date_of_birth: '1985-05-15',
        address: '789 Đường Nguyễn Huệ, Quận 3, TP.HCM',
        avatar_url: 'https://randomuser.me/api/portraits/men/22.jpg',
        store_name: 'Pet Shop Huy Hòa',
        store_address: '789 Đường Nguyễn Huệ, Quận 3, TP.HCM',
        business_license: 'LICENSE-2024-102',
        store_logo:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0UfKhzDj1uvWfda3-VR2LvdH6qz2o4zT6eA&s',
        business_license_url:
          'https://strapi-efex.ichiba.net/uploads/2022/06/Common-types-of-business-license.jpg',
        store_description: 'Chuyên cung cấp sản phẩm chất lượng cao cho thú cưng.',
        is_store_verified: true,
      },
      {
        username: 'admin_hoanganh',
        password: 'hashedpassword3',
        email: 'admin_hoanganh@gmail.com',
        role: ['Admin'],
        full_name: 'Hoàng Anh',
        phone: '0912345678',
        gender: 'Nữ',
        date_of_birth: '1990-09-12',
        address: '456 Đường Lê Lợi, Quận 4, TP.HCM',
        avatar_url: 'https://randomuser.me/api/portraits/women/33.jpg',
        is_active: true,
        is_verified: true,
      },
      {
        username: 'Bán Hàng Long Dương',
        password: 'Hashedpassword4@',
        email: 'hoangha_seller@gmail.com',
        role: ['PetOwner', 'Seller'],
        full_name: 'Hoàng Hà',
        phone: '0923456789',
        gender: 'Nữ',
        date_of_birth: '1995-06-18',
        address: '678 Đường Trần Hưng Đạo, Quận 5, TP.HCM',
        avatar_url: 'https://randomuser.me/api/portraits/women/44.jpg',
        store_name: 'Thế Giới Thú Cưng',
        store_address: '678 Đường Trần Hưng Đạo, Quận 5, TP.HCM',
        business_license: 'LICENSE-2024-103',
        store_logo:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0UfKhzDj1uvWfda3-VR2LvdH6qz2o4zT6eA&s',
        business_license_url:
          'https://strapi-efex.ichiba.net/uploads/2022/06/Common-types-of-business-license.jpg',
        store_description: 'Địa chỉ tin cậy cho thú cưng và các sản phẩm liên quan.',
        is_store_verified: false,
      },
      {
        username: 'Bác sĩ Anh',
        password: 'hashedpassword5@',
        email: 'phuonganh_doctor@gmail.com',
        role: ['Doctor', 'PetOwner'],
        full_name: 'Hoàng Anh',
        phone: '0945678901',
        gender: 'Nữ',
        date_of_birth: '1982-07-25',
        address: '789 Đường Võ Văn Kiệt, Quận 10, TP.HCM',
        avatar_url: 'https://randomuser.me/api/portraits/women/55.jpg',
        cccd: '987654321098',
        cccd_front_image:
          'https://upload.wikimedia.org/wikipedia/commons/a/a2/Stylized_Vietnamese_Citizen_Identity_Card_sample.jpg',
        cccd_back_image:
          'https://upload.wikimedia.org/wikipedia/commons/a/a2/Stylized_Vietnamese_Citizen_Identity_Card_sample.jpg',
        clinic_address: '123 Đường Hoàng Hoa Thám',
        practice_certificate: 'CERT-2024-104',
        experience_years: 8,
        opening_time: '09:00',
        closing_time: '18:00',
        doctor_avatar:
          'https://hthaostudio.com/wp-content/uploads/2022/03/Anh-bac-si-nam-7-min.jpg.webp',
        certificate_image:
          'https://c20968e4.rocketcdn.me/wp-content/uploads/2022/10/iau-dba-certificate_image.jpg',
        is_doctor_approved: true,
      },
      {
        username: 'Tiến',
        password: 'Tien2003@',
        email: 'duongvantiendtu@gmail.com',
        role: ['PetOwner'],
        full_name: 'Dương Văn Tiến',
        phone: '0932123456',
        gender: 'Nam',
        date_of_birth: '1993-11-10',
        address: '234 Đường Lê Văn Sỹ, Quận Phú Nhuận, TP.HCM',
        avatar_url: 'https://randomuser.me/api/portraits/men/56.jpg',
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

seedUsers();
