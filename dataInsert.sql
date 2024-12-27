INSERT INTO Categories (name, type, is_active, createdAt, updatedAt)
VALUES ('Chó', 'Thú cưng', TRUE, NOW(), NOW()),
       ('Mèo', 'Thú cưng', TRUE, NOW(), NOW()),
       ('Chích ngừa', 'Dịch vụ', TRUE, NOW(), NOW()),
       ('Chăm sóc lông', 'Dịch vụ', TRUE, NOW(), NOW()),
       ('Thức ăn', 'Sản phẩm', TRUE, NOW(), NOW()),
       ('Đồ chơi', 'Sản phẩm', TRUE, NOW(), NOW()),
       ('Thực phẩm bổ sung', 'Sản phẩm', TRUE, NOW(), NOW()),
       ('Chim cảnh', 'Thú cưng', TRUE, NOW(), NOW()),
       ('Bò sát', 'Thú cưng', TRUE, NOW(), NOW()),
       ('Phụ kiện', 'Sản phẩm', TRUE, NOW(), NOW());

INSERT INTO Users (username, password, email, phone, gender, role, full_name, date_of_birth, address, avatar_url, is_active, is_verified, last_login, reset_password_token, reset_password_expires_at, verification_token, verification_token_expires_at, cccd, cccd_front_image, cccd_back_image, clinic_address, practice_certificate, experience_years, opening_time, closing_time, doctor_avatar, certificate_image, is_doctor_approved, store_name, store_address, business_license, store_logo, business_license_url, store_description, is_store_verified, createdAt, updatedAt)
VALUES ('ViệtS', 'hashedpassword1', 'tranducviet@gmail.com', '0909123456', 'Nam', JSON_ARRAY ('PetOwner'), 'Nguyễn Văn Việt', '1980-02-15', '123 Đường ABC, Quận 10, TP.HCM', 'https://hthaostudio.com/wp-content/uploads/2022/03/Anh-bac-si-nam-7-min.jpg.webp', TRUE, TRUE, NULL, NULL, NULL, NULL, NULL, '0123456789', NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, TRUE, NULL, NULL, NULL, NULL, NULL, NULL, FALSE, NOW(), NOW()),
       ('TiếnS', 'hashedpassword2', 'duongvantien@gmail.com', '0912345678', 'Nam', JSON_ARRAY ('Doctor', 'PetOwner'), 'Nguyễn Văn Tiến', '1985-05-22', '456 Đường DEF, Quận 3, TP.HCM', 'https://honghunghospital.com.vn/wp-content/uploads/2020/05/41.-Phan-V%C4%83n-Ch%C3%AD-scaled.jpg', TRUE, TRUE, NULL, NULL, NULL, NULL, NULL, '9876543210', NULL, NULL, '789 Clinic Address', 'Doctor Certificate', 10, '09:00:00', '18:00:00', 'https://randomuser.me/api/portraits/women/4.jpg', 'https://cdn.venngage.com/template/thumbnail/small/5bdeb833-5514-4c2d-9d67-b269371bb924.webp', TRUE, NULL, NULL, NULL, NULL, NULL, NULL, FALSE, NOW(), NOW()),
       ('Hưng', 'hashedpassword3', 'tranduyhung@gmail.com', '0923456789', 'Nam', JSON_ARRAY ('Doctor', 'PetOwner'), 'Nguyễn Văn Hưng', '1978-11-10', '789 Đường GHI, Quận 5, TP.HCM', 'https://bizweb.dktcdn.net/100/175/849/files/chup-anh-profile-cho-bac-si-tai-ha-noi-studio-yeu-media-dep-01.jpg?v=1636203347577', TRUE, TRUE, NULL, NULL, NULL, NULL, NULL, '1122334455', NULL, NULL, '123 Clinic Address', 'Doctor Certificate', 20, '07:00:00', '16:00:00', 'https://randomuser.me/api/portraits/men/6.jpg', 'https://cdn.venngage.com/template/thumbnail/small/5bdeb833-5514-4c2d-9d67-b269371bb924.webp', TRUE, NULL, NULL, NULL, NULL, NULL, NULL, FALSE, NOW(), NOW()),
       ('Dương', 'hashedpassword4', 'giangdaiduong@gmail.com', '0934567890', 'Nam', JSON_ARRAY ('Doctor', 'PetOwner'), 'Nguyễn Văn Dương', '1990-08-30', '101 Đường JKL, Quận 7, TP.HCM', 'https://hthaostudio.com/wp-content/uploads/2022/03/Anh-bac-si-nam-7-min.jpg.webp', TRUE, TRUE, NULL, NULL, NULL, NULL, NULL, '2233445566', NULL, NULL, '987 Clinic Address', 'Doctor Certificate', 8, '10:00:00', '19:00:00', 'https://randomuser.me/api/portraits/women/8.jpg', 'https://cdn.venngage.com/template/thumbnail/small/5bdeb833-5514-4c2d-9d67-b269371bb924.webp', TRUE, NULL, NULL, NULL, NULL, NULL, NULL, FALSE, NOW(), NOW()),
       ('Tín', 'hashedpassword5', 'vanductin@gmail.com', '0945678901', 'Nam', JSON_ARRAY ('Doctor', 'PetOwner'), 'Hoàng Văn Tín', '1975-03-18', '202 Đường MNO, Quận 8, TP.HCM', 'https://hthaostudio.com/wp-content/uploads/2022/03/Anh-bac-si-nam-4-min.jpg', TRUE, TRUE, NULL, NULL, NULL, NULL, NULL, '3344556677', NULL, NULL, '654 Clinic Address', 'Doctor Certificate', 25, '08:30:00', '17:30:00', 'https://randomuser.me/api/portraits/men/10.jpg', 'https://cdn.venngage.com/template/thumbnail/small/5bdeb833-5514-4c2d-9d67-b269371bb924.webp', TRUE, NULL, NULL, NULL, NULL, NULL, NULL, FALSE, NOW(), NOW());
       
INSERT INTO Users (username, password, email, phone, gender, ROLE, full_name, date_of_birth, address, avatar_url, is_active, is_verified, last_login, reset_password_token, reset_password_expires_at, verification_token, verification_token_expires_at, cccd, cccd_front_image, cccd_back_image, clinic_address, practice_certificate, experience_years, opening_time, closing_time, doctor_avatar, certificate_image, is_doctor_approved, store_name, store_address, business_license, store_logo, business_license_url, store_description, is_store_verified, createdAt, updatedAt)
VALUES ('Vũ Long', 'hashedpassword6', 'vuthif@gmail.com', '0956789012', 'Nu', JSON_ARRAY ('Seller', 'PetOwner'), 'Vũ Văn Long', '1983-07-12', '303 Đường PQR, Quận 9, TP.HCM', 'https://randomuser.me/api/portraits/men/22.jpg', TRUE, TRUE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Vũ Thị Store', '303 Đường PQR, Quận 9, TP.HCM', 'License1236', 'https://static.vecteezy.com/system/resources/thumbnails/020/662/330/small/store-icon-logo-illustration-vector.jpg', 'https://lsx.vn/wp-content/uploads/2022/06/Thu-tuc-xin-cap-giay-phep-kinh-doanh-cua-hang-2.jpg', 'High-quality products for everyday use.', TRUE, NOW(), NOW()),
       ('Long', 'hashedpassword7', 'nguyenvang@gmail.com', '0967890123', 'Nam', JSON_ARRAY ('Seller', 'PetOwner'), 'Nguyễn Văn Long', '1988-12-25', '404 Đường STU, Quận 1, TP.HCM', 'https://randomuser.me/api/portraits/men/22.jpg', TRUE, TRUE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Nguyễn Văn Store', '404 Đường STU, Quận 1, TP.HCM', 'License1237', 'https://img.freepik.com/premium-vector/shopping-logo-design_852937-4657.jpg', 'https://lsx.vn/wp-content/uploads/2022/06/Thu-tuc-xin-cap-giay-phep-kinh-doanh-cua-hang-2.jpg', 'Reliable and affordable items for the community.', TRUE, NOW(), NOW()),
       ('Hiếu', 'hashedpassword8', 'phamthih@gmail.com', '0978901234', 'Nam', JSON_ARRAY ('Seller', 'PetOwner'), 'Dương Hiếu', '1995-01-14', '505 Đường VWX, Quận 4, TP.HCM', 'https://randomuser.me/api/portraits/men/22.jpg', TRUE, TRUE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Phạm Thị Store', '505 Đường VWX, Quận 4, TP.HCM', 'License1238', 'https://img.freepik.com/premium-vector/shopping-logo-design_852937-4657.jpg', 'https://lsx.vn/wp-content/uploads/2022/06/Thu-tuc-xin-cap-giay-phep-kinh-doanh-cua-hang-2.jpg', 'Eco-friendly products at great prices.', TRUE, NOW(), NOW()),
       ('Hùngg', 'hashedpassword9', 'levani@gmail.com', '0989012345', 'Nam', JSON_ARRAY ('Seller', 'PetOwner'), 'Lê Văn Hùng', '1972-04-05', '606 Đường YZ, Quận 6, TP.HCM', 'https://randomuser.me/api/portraits/men/24.jpg', TRUE, TRUE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lê Văn Store', '606 Đường YZ, Quận 6, TP.HCM', 'License1239', 'https://img.freepik.com/premium-vector/shop-logo-design-template_636083-27.jpg?semt=ais_hybrid', 'https://lsx.vn/wp-content/uploads/2022/06/Thu-tuc-xin-cap-giay-phep-kinh-doanh-cua-hang-2.jpg', 'Your trusted store for all essentials.', TRUE, NOW(), NOW()),
       ('Anh', 'hashedpassword10', 'tranthij@gmail.com', '0990123456', 'Nam', JSON_ARRAY ('Seller', 'PetOwner'), 'Trần Anh', '1992-09-09', '707 Đường ABC, Quận 2, TP.HCM', 'https://randomuser.me/api/portraits/men/22.jpg', TRUE, TRUE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Trần Thị Store', '707 Đường ABC, Quận 2, TP.HCM', 'License1240', 'https://i.pinimg.com/736x/11/ba/06/11ba06d04c79fdca4086172d7917b7af.jpg', 'https://lsx.vn/wp-content/uploads/2022/06/Thu-tuc-xin-cap-giay-phep-kinh-doanh-cua-hang-2.jpg', 'Bringing the best deals to you.', TRUE, NOW(), NOW());      

INSERT INTO Users (username, password, email, phone, gender, ROLE, full_name, date_of_birth, address, avatar_url, is_active, is_verified, last_login, reset_password_token, reset_password_expires_at, verification_token, verification_token_expires_at, cccd, cccd_front_image, cccd_back_image, clinic_address, practice_certificate, experience_years, opening_time, closing_time, doctor_avatar, certificate_image, is_doctor_approved, store_name, store_address, business_license, store_logo, business_license_url, store_description, is_store_verified, createdAt, updatedAt)
VALUES ('MinhQuân', 'hashedpassword11', 'minhquan@gmail.com', '0912345678', 'Nam', JSON_ARRAY('Seller', 'PetOwner'), 'Nguyễn Minh Quân', '1990-06-15', '908 Đường XYZ, Quận 12, TP.HCM', 'https://randomuser.me/api/portraits/men/26.jpg', TRUE, TRUE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Minh Quân Store', '908 Đường XYZ, Quận 12, TP.HCM', 'License1250', 'https://img.freepik.com/premium-vector/shop-logo-design-template_636083-27.jpg?semt=ais_hybrid', 'https://dongho24h.com/upload/1_19-TRUST_BRAND.jpg', 'Providing excellent products and services to customers.', TRUE, NOW(), NOW()),
       ('HồngAnh', 'hashedpassword12', 'honganh@gmail.com', '0923456789', 'Nữ', JSON_ARRAY('Seller', 'PetOwner'), 'Lê Hồng Anh', '1985-03-21', '456 Đường UVW, Quận 10, TP.HCM', 'https://randomuser.me/api/portraits/women/45.jpg', TRUE, TRUE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hồng Anh Store', '456 Đường UVW, Quận 10, TP.HCM', 'License1251', 'https://img.freepik.com/premium-vector/shop-logo-design-template_636083-27.jpg?semt=ais_hybrid', 'https://dongho24h.com/upload/1_19-TRUST_BRAND.jpg', 'Best deals on household items.', TRUE, NOW(), NOW()),
       ('PhúcTài', 'hashedpassword13', 'phuctai@gmail.com', '0934567890', 'Nam', JSON_ARRAY('Seller', 'PetOwner'), 'Phạm Phúc Tài', '1992-08-14', '123 Đường DEF, Quận 7, TP.HCM', 'https://randomuser.me/api/portraits/men/34.jpg', TRUE, TRUE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Phúc Tài Store', '123 Đường DEF, Quận 7, TP.HCM', 'License1252', 'https://img.freepik.com/premium-vector/shop-logo-design-template_636083-27.jpg?semt=ais_hybrid', 'https://dongho24h.com/upload/1_19-TRUST_BRAND.jpg', 'Quality products for your pets.', TRUE, NOW(), NOW()),
       ('ThuHà', 'hashedpassword14', 'thuha@gmail.com', '0945678901', 'Nữ', JSON_ARRAY('Seller', 'PetOwner'), 'Nguyễn Thu Hà', '1987-11-03', '789 Đường GHI, Quận 9, TP.HCM', 'https://randomuser.me/api/portraits/women/29.jpg', TRUE, TRUE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Thu Hà Store', '789 Đường GHI, Quận 9, TP.HCM', 'License1253', 'https://img.freepik.com/premium-vector/shop-logo-design-template_636083-27.jpg?semt=ais_hybrid', 'https://dongho24h.com/upload/1_19-TRUST_BRAND.jpg', 'Eco-friendly and sustainable goods.', TRUE, NOW(), NOW()),
       ('HoàngVũ', 'hashedpassword15', 'hoangvu@gmail.com', '0956789012', 'Nam', JSON_ARRAY('Seller', 'PetOwner'), 'Hoàng Văn Vũ', '1990-04-10', '234 Đường JKL, Quận 5, TP.HCM', 'https://randomuser.me/api/portraits/men/27.jpg', TRUE, TRUE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hoàng Vũ Store', '234 Đường JKL, Quận 5, TP.HCM', 'License1254', 'https://img.freepik.com/premium-vector/shop-logo-design-template_636083-27.jpg?semt=ais_hybrid', 'https://dongho24h.com/upload/1_19-TRUST_BRAND.jpg', 'Trusted source for pet care essentials.', TRUE, NOW(), NOW());

INSERT INTO Products (sales_center_id, category_id, name, description, price, stock_quantity, sku, images, createdAt, updatedAt)
VALUES
       (2, 5, 'Thức ăn cao cấp cho chó', 'Dinh dưỡng đầy đủ cho chó mọi lứa tuổi', 300000, 150, 'DOGFOOD_VN0011', 'https://winsgroup.vn/media/120/catalog/ch%C3%B3%20tr%C6%B0%E1%BB%9Fng%20th%C3%A0nh.jpg', NOW(), NOW()),
       (4, 6, 'Đồ chơi thông minh cho mèo', 'Giúp mèo hoạt động và giảm căng thẳng', 120000, 80, 'CATTOY_VN0013', 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltkjrzbb2ya214', NOW(), NOW()),
       (2, 5, 'Thức ăn cho mèo lông dài', 'Bổ sung Omega 3 và 6 cho lông mượt', 250000, 100, 'CATFOOD_VN0014', 'https://www.vietpet.net/wp-content/uploads/2020/07/thuc-an-cho-meo-truong-thanh-long-dai-equilibrio-adult-cat-long-hair.jpg', NOW(), NOW()),
       (4, 7, 'Vitamin tổng hợp cho thú cưng', 'Giúp thú cưng khỏe mạnh hơn', 180000, 200, 'VITAMIN_VN0015', 'https://www.petmart.vn/wp-content/uploads/2016/01/thuoc-bo-sung-vitamin-tong-hop-cho-cho-vegebrand-fruit-vitamin2.jpg', NOW(), NOW()),
       (2, 6, 'Bóng đồ chơi cho chó', 'Chất liệu cao su bền, an toàn', 70000, 300, 'DOGTOY_VN0016', 'https://luckypetshop.vn/wp-content/uploads/2020/01/bong-7-sat-cho-cho-meo-5.jpg', NOW(), NOW()),
       (4, 7, 'Omega 3 cho chó', 'Giúp da và lông khỏe mạnh', 220000, 120, 'OMEGA_VN0017', 'https://thanhtrangpharma.vn/uploads/1%20dong%20vat/1011.jpg', NOW(), NOW()),
       (4, 10, 'Dây dắt chó', 'Chất liệu nylon bền bỉ', 90000, 200, 'LEASH_VN0019', 'https://www.petmart.vn/wp-content/uploads/2021/08/bo-vong-co-cho-kem-day-dat-cuong-luc-hele-hl-a001c.jpg', NOW(), NOW()),
       (2, 7, 'Bột canxi cho chó mèo', 'Bổ sung canxi giúp xương chắc khỏe', 150000, 90, 'CALCIUM_VN00110', 'https://www.petmart.vn/wp-content/uploads/2017/09/bot-dinh-duong-canxi-cho-cho-meo-paw-chondroitin-calcium-powder.jpg', NOW(), NOW()),
       (2, 5, 'Bánh thưởng cho chó', 'Được làm từ thịt bò tươi, ngon miệng', 50000, 250, 'DOGTREAT_VN00112', 'https://pethouse.com.vn/wp-content/uploads/2022/10/9-banh-thuong-cho-cho-meo-Luscious-ho-tro-trong-qua-trinh-huan-luyen-220g-1.jpg', NOW(), NOW()),
       (4, 8, 'Giày bảo vệ cho chó', 'Giúp bảo vệ chân chó khỏi các bề mặt nóng, cứng', 150000, 150, 'DOGSHOE_VN00113', 'https://down-vn.img.susercontent.com/file/sg-11134201-7rdxx-lzw6h41bw8iw29', NOW(), NOW()),
       (2, 6, 'Bóng đựng thức ăn cho chó', 'Bóng thông minh giúp chó chơi và ăn cùng lúc', 80000, 180, 'DOGFEEDER_VN00114', 'https://salt.tikicdn.com/cache/280x280/ts/product/0e/6f/83/b2698dd122d1d4865827304737cd4839.jpg', NOW(), NOW()),
       (4, 5, 'Dây dắt chó đeo cổ', 'Dây dắt chó tiện lợi, nhẹ nhàng', 120000, 220, 'COLLAR_VN00115', 'https://product.hstatic.net/200000264739/product/day_dat_zichen_1cm_1.5cm_b1aa163ca47e4e608aeeadb296a73a79_master.jpg', NOW(), NOW()),
       (2, 7, 'Thức ăn bổ sung cho chó', 'Cung cấp dưỡng chất cho chó trưởng thành', 230000, 110, 'SUPPLEMENT_VN00116', 'https://cdn.tgdd.vn/Files/2021/04/14/1343337/10-loai-thuc-an-cho-cho-con-dinh-duong-nhat-hien-nay-202104141607304502.jpg', NOW(), NOW()),
       (2, 5, 'Thức ăn cho chó trưởng thành', 'Cung cấp đầy đủ dinh dưỡng cho chó trưởng thành', 350000, 190, 'DOGADULT_VN00118', 'https://cdn-img-v2.mybota.vn/uploadv2/web/12/12107/product/2019/10/17/04/11/1571285467_pedigree-truong-thanh-bo-500gr.jpg', NOW(), NOW()),
       (4, 9, 'Bàn chải cho chó', 'Giúp làm sạch lông cho chó', 45000, 210, 'DOGBRUSH_VN00119', 'https://fagopet.vn/storage/p2/gt/p2gtpml411h0efvo36poexp5eagd_ban-chai-danh-rang-cho-cho-1.webp', NOW(), NOW()),
       (2, 7, 'Thức ăn cho chó con', 'Dinh dưỡng đầy đủ cho chó con', 200000, 170, 'PUPPYFOOD_VN00120', 'https://fagopet.vn/uploads/images/6289c95c9487f626bf2d85ae/thuc-an-cho-cho-con-pedigree-ga-va-trung-400g.webp', NOW(), NOW()),
       (4, 5, 'Túi xách cho chó', 'Túi xách cho chó tiện dụng', 180000, 120, 'DOGBAG_VN00121', 'https://iupets.vn/wp-content/uploads/2020/05/tui-xach-thu-cung-3.jpg', NOW(), NOW()),
       (2, 6, 'Đồ chơi nhồi bông cho mèo', 'Đồ chơi mềm mại cho mèo vui chơi', 70000, 230, 'STUFFEDTOY_VN00122', 'https://cunsieupham.com/wp-content/uploads/2020/03/8933274550_1118210482.jpg', NOW(), NOW()),
       (4, 5, 'Nệm nằm cho chó', 'Nệm êm ái cho chó ngủ ngon', 200000, 130, 'DOGBED_VN00123', 'https://product.hstatic.net/200000264739/product/dem_lot_roi_88888076b8304f3bb8c462a8dee54ce3_master.jpg', NOW(), NOW()),
       (4, 7, 'Thực phẩm cho chó già', 'Giúp chó già khỏe mạnh và ăn ngon miệng', 300000, 140, 'SENIORDOGFOOD_VN00125', 'https://samyangvietnam.com/wp-content/uploads/2023/12/thuc-an-cho-cho-nutri-plan.jpg', NOW(), NOW()),
       (2, 6, 'Sữa cho mèo', 'Cung cấp dưỡng chất cho mèo', 150000, 90, 'CATSUPPLEMENT_VN00126', 'https://cdn.tgdd.vn/Files/2021/04/23/1345730/meo-uong-sua-lieu-co-tot-khong-top-7-loai-sua-bot-cho-meo-con-tot-nhat-hien-nay-202206061448102335.jpg', NOW(), NOW()),
       (4, 5, 'Dây đeo cổ cho chó', 'Dây đeo cổ chất liệu bền bỉ', 80000, 250, 'DOGCOLLAR_VN00127', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCmgWeIAOsZXURBRrRC7Y7OahHOCUsf1yBsg&s', NOW(), NOW()),
       (2, 5, 'Giường nằm cho chó', 'Giường thoải mái cho chó ngủ', 220000, 200, 'DOGCUSHION_VN00128', 'https://chimgogo.com/wp-content/uploads/2019/05/CGG-TI-GTC-002-000-1.jpg', NOW(), NOW()),
       (4, 5, 'Chăn cho chó', 'Chăn ấm áp cho chó vào mùa đông', 130000, 190, 'DOGBLANKET_VN00129', 'https://luckypetshop.vn/wp-content/uploads/2019/12/chan-cho-cho-meo-bang-nhung-1.jpg', NOW(), NOW()),
       (2, 8, 'Thức ăn cho thú cưng', 'Dinh dưỡng cho thú cưng mọi lứa tuổi', 120000, 200, 'PETFOOD_VN00130', 'https://cdn.tgdd.vn/Files/2022/03/08/1419010/mua-ngay-do-an-cho-thu-cung-tot-chinh-hang-gia-cuc-tot-tai-bach-hoa-xanh-202203080700181164.jpg', NOW(), NOW()),
       (2, 7, 'Giày đi cho chó', 'Giúp bảo vệ chân chó khỏi các bề mặt thô', 150000, 110, 'DOGSHOES_VN00132', 'https://pethouse.com.vn/wp-content/uploads/2022/12/giay-di-mua-cho-cho-2-800x800.jpg', NOW(), NOW()),
       (4, 6, 'Chất tẩy rửa cho mèo', 'Chất tẩy rửa giúp vệ sinh cho mèo', 40000, 250, 'CATCLEANER_VN00133', 'https://sieuthihanghoachauau.com/image/632415c143affaf390895783/original.jpg', NOW(), NOW()),
       (2, 7, 'Dầu gội cho chó', 'Giúp chó sạch sẽ và mượt mà', 120000, 180, 'DOGSHAMPOO_VN00134', 'https://www.vietpet.net/wp-content/uploads/2020/07/dau-goi-cho-cho-meo-professional-pet-products-tearless-pet-shampoo.jpg', NOW(), NOW()),
       (4, 5, 'Thức ăn bổ sung cho mèo', 'Giúp mèo khỏe mạnh và đẹp lông', 250000, 190, 'CATSUPPLEMENT_VN00135', 'https://product.hstatic.net/200000264739/product/nutri_pocket_mix_1_d008a218320f442ab3bedd3ea4aa6544_large.jpg', NOW(), NOW()),
       (2, 5, 'Đồ chơi bóng cho chó', 'Bóng chất liệu cao su an toàn cho chó', 90000, 150, 'DOGBALL_VN00136', 'https://vietgiftmarket.com/wp-content/uploads/2019/08/bong-do-choi-danh-cho-cho-meo-ma-dccm158.jpg', NOW(), NOW()),
       (4, 7, 'Thức ăn cho chó nhỏ', 'Dinh dưỡng dành riêng cho chó nhỏ', 220000, 160, 'SMALLDOGFOOD_VN00137', 'https://www.petmart.vn/wp-content/uploads/2021/06/thuc-an-cho-cho-con-co-nho-royal-canin-mini-puppy2.jpg', NOW(), NOW()),
       (4, 7, 'Bánh thưởng cho mèo', 'Bánh thưởng cho mèo thích ăn', 50000, 180, 'CATTREATS_VN00139', 'https://pethouse.com.vn/wp-content/uploads/2022/10/banh-thuong-cho-meo-me-o-50g-800x800.jpg', NOW(), NOW()),
       (2, 8, 'Sữa cho chó', 'Sữa dinh dưỡng cho chó con', 150000, 140, 'PUPPYSUPPLEMENT_VN00140', 'https://fagopet.vn/storage/rd/ci/rdcigaf84ad4gyhewkiwqdmdm3l1_dr-kyan-predogen.jpg', NOW(), NOW()),
       (4, 6, 'Bộ dụng cụ chăm sóc mèo', 'Dụng cụ giúp chăm sóc mèo dễ dàng', 80000, 200, 'CATCARE_VN00141', 'https://fagopet.vn/storage/9q/lq/9qlqpm34zg3g0r2alkvllkdsgs21_gang-tay-tam-cho-cho-meo-3.webp', NOW(), NOW());

INSERT INTO Pets (owner_id, category_id, name, breed, age, gender, description, medical_history, is_active, images, createdAt, updatedAt)
VALUES
    (6, 1, 'Lucky', 'Phốc Sóc', 1, 'Đực', 'Thân thiện và năng động', 'Chích ngừa đầy đủ', TRUE, 'https://cdn.tgdd.vn/Files/2021/04/14/1343203/cach-nuoi-cho-phoc-dung-ky-thuat-ma-ban-can-biet-202104140029565856.jpg', NOW(), NOW()),
    (6, 2, 'Miu', 'Mèo Ba Tư', 2, 'Cái', 'Trầm tĩnh, thích yên tĩnh', 'Đã chích ngừa dại', TRUE, 'https://cdn.eva.vn/upload/3-2022/images/2022-08-26/image7-1661495595-967-width1180height800.jpg', NOW(), NOW()),
    (6, 1, 'Bông', 'Chihuahua', 1, 'Đực', 'Rất thông minh và đáng yêu', 'Chích ngừa sổ giun', TRUE, 'https://pethouse.com.vn/wp-content/uploads/2023/06/cho-chihuahua.jpg', NOW(), NOW());

INSERT INTO Orders (petOwner_id, total_amount, status, createdAt, updatedAt)
VALUES (6, 300000, 'Đang xử lý', NOW(), NOW()),
       (6, 120000, 'Chờ thanh toán', NOW(), NOW()),
       (6, 180000, 'Hoàn thành', NOW(), NOW()),
       (6, 70000, 'Hủy', NOW(), NOW()),
       (6, 220000, 'Đang xử lý', NOW(), NOW()),
       (6, 100000, 'Hoàn thành', NOW(), NOW()),
       (6, 90000, 'Đã giao', NOW(), NOW()),
       (6, 150000, 'Đã giao', NOW(), NOW()),
       (6, 300000, 'Đang vận chuyển', NOW(), NOW()),
       (6, 250000, 'Chờ thanh toán', NOW(), NOW());


INSERT INTO OrderItems (order_id, product_id, quantity, unit_price, subtotal, createdAt, updatedAt)
VALUES (1, 1, 1, 300000, 300000, NOW(), NOW()),
       (2, 2, 1, 120000, 120000, NOW(), NOW()),
       (3, 4, 1, 180000, 180000, NOW(), NOW()),
       (4, 5, 1, 70000, 70000, NOW(), NOW()),
       (5, 6, 1, 220000, 220000, NOW(), NOW()),
       (6, 7, 1, 100000, 100000, NOW(), NOW()),
       (7, 8, 1, 90000, 90000, NOW(), NOW()),
       (8, 9, 1, 150000, 150000, NOW(), NOW()),
       (9, 10, 1, 300000, 300000, NOW(), NOW()),
       (10, 3, 1, 250000, 250000, NOW(), NOW());

INSERT INTO Payments (order_id, amount, payment_method, status, transaction_id, payment_date, createdAt, updatedAt)
VALUES (1, 300000, 'Thẻ tín dụng', 'Hoàn thành', 'TXVN123456', '2024-10-15 10:30:00', NOW(), NOW()),
       (2, 120000, 'Thẻ tín dụng', 'Chờ xử lý', 'TXVN654321', '2024-10-16 11:00:00', NOW(), NOW()),
       (3, 180000, 'Thẻ tín dụngt', 'Hoàn thành', 'TXVN789012', '2024-10-17 09:45:00', NOW(), NOW()),
       (4, 70000, 'Thẻ tín dụng', 'Hủy', 'TXVN345678', '2024-10-18 13:15:00', NOW(), NOW()),
       (5, 220000, 'Thẻ tín dụng', 'Đang xử lý', 'TXVN901234', '2024-10-19 08:20:00', NOW(), NOW()),
       (6, 100000, 'Thẻ tín dụng', 'Hoàn thành', 'TXVN567890', '2024-10-20 15:00:00', NOW(), NOW()),
       (7, 90000, 'Thẻ tín dụng', 'Đang xử lý', 'TXVN234567', '2024-10-21 16:45:00', NOW(), NOW()),
       (8, 150000, 'Thẻ tín dụng', 'Đang xử lý', 'TXVN678901', '2024-10-22 17:30:00', NOW(), NOW()),
       (9, 300000, 'Thẻ tín dụng', 'Đang xử lý', 'TXVN890123', '2024-10-23 14:10:00', NOW(), NOW()),
       (10, 250000, 'Thẻ tín dụng', 'Đang xử lý', 'TXVN456789', '2024-10-24 19:00:00', NOW(), NOW());

INSERT INTO Posts (petOwner_Id, title, content, image_url, counterLike, createdAt, updatedAt)
VALUES (3, 'Chia sẻ kinh nghiệm nuôi chó', 'Chó của tôi rất đáng yêu và dễ thương...', 'https://icdn.dantri.com.vn/thumb_w/960/2019/01/20/2-1547917870331.jpg', 15, NOW(), NOW()),
       (4, 'Kinh nghiệm chăm sóc mèo lông dài', 'Mèo cần phải chải lông thường xuyên để giữ sạch sẽ...', 'https://img.tripi.vn/cdn-cgi/image/width=700,height=700/https://gcs.tripi.vn/public-tripi/tripi-feed/img/474095WoH/anh-avatar-hinh-con-meo-cute_051725044.png', 22, NOW(), NOW()),
       (7, 'Chơi với cún cưng hàng ngày', 'Mỗi ngày chơi với cún giúp tăng sự gắn kết...', 'https://inkythuatso.com/uploads/thumbnails/800/2023/02/hinh-anh-cun-con-de-thuong-mat-ngo-ngac-1-24-11-47-36.jpg', 18, NOW(), NOW()),
       (10, 'Chăm sóc chim cảnh', 'Chim cần môi trường sạch và thức ăn phù hợp...', 'https://cdn.tgdd.vn/Files/2021/04/12/1342859/cac-giong-chim-canh-pho-bien-thuong-duoc-nuoi-tai-viet-nam-202104121951310007.jpg', 20, NOW(), NOW()),
       (3, 'Lợi ích của thực phẩm bổ sung', 'Thực phẩm bổ sung giúp thú cưng khỏe mạnh hơn...', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-ipbNvauq1oj2yw7erf0gZmZoB6Qe5T4agQ&s', 10, NOW(), NOW()),
       (4, 'Cách chọn đồ chơi cho mèo', 'Đồ chơi phù hợp giúp mèo giảm stress và tăng vận động...', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/307/433/products/do-choi-meo-ban-cao-mong-bien-hinh-kem-bong-cho-meo.jpg?v=1666200704487', 25, NOW(), NOW()),
       (7, 'Bí quyết nuôi Rottweiler', 'Rottweiler rất trung thành và bảo vệ tốt...', 'https://upload.wikimedia.org/wikipedia/commons/f/f9/%22Prince%22_%287216225820%29.jpg', 30, NOW(), NOW()),
       (10, 'Chăm sóc kỳ nhông', 'Kỳ nhông cần được kiểm tra sức khỏe định kỳ...', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0kyxUxKo8_-gov44OTWRNcg9H8a83U6J82Q&s', 12, NOW(), NOW()),
       (3, 'Bí quyết nuôi chim vành khuyên', 'Chim vành khuyên rất năng động và cần môi trường sạch...', 'https://cdn.eva.vn/upload/4-2021/images/2021-10-01/image3-1633053449-196-width600height450.jpg', 18, NOW(), NOW()),
       (4, 'Làm sao để chăm sóc rùa cạn?', 'Rùa cạn cần chế độ ăn đặc biệt và môi trường thích hợp...', 'https://mew.vn/wp-content/uploads/2019/12/danh-muc-rua-can-2.jpg', 22, NOW(), NOW());


INSERT INTO Comments (post_id, petOwner_Id, content, createdAt, updatedAt)
VALUES (1, 4, 'Cảm ơn bạn đã chia sẻ kinh nghiệm hữu ích!', NOW(), NOW()),
       (2, 3, 'Mình cũng nuôi mèo, rất đồng cảm với bạn!', NOW(), NOW()),
       (3, 7, 'Thật tuyệt! Chó của bạn rất đáng yêu!', NOW(), NOW()),
       (4, 10, 'Chăm sóc chim đúng cách sẽ giúp chúng sống lâu hơn.', NOW(), NOW()),
       (5, 4, 'Thực phẩm bổ sung thực sự quan trọng cho sức khỏe thú cưng.', NOW(), NOW()),
       (6, 3, 'Mèo của tôi cũng thích đồ chơi này, rất vui nhộn!', NOW(), NOW()),
       (7, 10, 'Rottweiler của bạn rất khỏe mạnh và trung thành.', NOW(), NOW()),
       (8, 7, 'Cảm ơn đã chia sẻ kinh nghiệm chăm sóc kỳ nhông.', NOW(), NOW()),
       (9, 4, 'Chim vành khuyên rất đáng yêu, cảm ơn bạn!', NOW(), NOW()),
       (10, 3, 'Rùa cạn cần môi trường sống đặc biệt, cảm ơn bạn đã chia sẻ.', NOW(), NOW());


INSERT INTO Coupons (code, description, discount_type, discount_value, start_date, end_date, is_active, product_id, createdAt, updatedAt)
VALUES ('GIAM10', 'Giảm 10% cho tất cả sản phẩm', 'Percentage', 10.00, '2024-10-01', '2024-12-31', TRUE, 1, NOW(), NOW()),
       ('GIAM15', 'Giảm 15% cho đơn hàng trên 500.000đ', 'Percentage', 15.00, '2024-11-01', '2024-11-30', TRUE, 2, NOW(), NOW()),
       ('GIAM20', 'Giảm 20% cho khách hàng mới', 'Percentage', 20.00, '2024-10-15', '2024-12-15', TRUE, 3, NOW(), NOW()),
       ('FREESHIP', 'Miễn phí vận chuyển cho đơn hàng trên 300.000đ', 'FreeShipping', 0, '2024-11-01', '2024-11-30', TRUE, NULL, NOW(), NOW()),
       ('SALE50', 'Giảm 50% cho sản phẩm đồ chơi cho mèo', 'Percentage', 50.00, '2024-10-01', '2024-10-31', TRUE, 2, NOW(), NOW()),
       ('GIAM5', 'Giảm 5% cho tất cả đơn hàng', 'Percentage', 5.00, '2024-10-01', '2024-12-31', TRUE, NULL, NOW(), NOW()),
       ('MEMBER10', 'Giảm 10% cho thành viên VIP', 'Percentage', 10.00, '2024-11-01', '2024-12-31', TRUE, NULL, NOW(), NOW()),
       ('BLACKFRI', 'Giảm 30% cho ngày Black Friday', 'Percentage', 30.00, '2024-11-25', '2024-11-25', TRUE, NULL, NOW(), NOW()),
       ('XMAS25', 'Giảm 25% cho mùa Giáng sinh', 'Percentage', 25.00, '2024-12-01', '2024-12-25', TRUE, NULL, NOW(), NOW()),
       ('NEWYEAR', 'Giảm 15% cho dịp Năm Mới', 'Percentage', 15.00, '2024-12-30', '2025-01-05', TRUE, NULL, NOW(), NOW());


INSERT INTO Appointments (pet_owner_id, pet_id, doctor_id, appointment_date, appointment_time, status, notes, createdAt, updatedAt)
VALUES (6, 1, 1, '2024-11-05', '09:00:00', 'Đã đặt lịch', 'Khám sức khỏe định kỳ cho Lucky', NOW(), NOW()),
       (6, 2, 5, '2024-11-06', '14:30:00', 'Đã đặt lịch', 'Kiểm tra sức khỏe cho Miu', NOW(), NOW()),
       (6, 3, 1, '2024-11-07', '11:00:00', 'Đã đặt lịch', 'Tiêm phòng cho Bông', NOW(), NOW());