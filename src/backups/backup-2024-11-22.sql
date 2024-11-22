/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: appointments
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `appointments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pet_owner_id` int NOT NULL,
  `pet_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `appointment_date` datetime NOT NULL,
  `appointment_time` time NOT NULL,
  `status` varchar(50) DEFAULT 'Đã đặt lịch',
  `notes` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pet_owner_id` (`pet_owner_id`),
  KEY `pet_id` (`pet_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`pet_owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: categories
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_type` (`type`),
  KEY `categories_is_active` (`is_active`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: comments
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `petOwner_Id` int NOT NULL,
  `content` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_post_id` (`post_id`),
  KEY `idx_petOwner_id` (`petOwner_Id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`petOwner_Id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: coupons
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `description` text,
  `discount_type` enum('Percentage', 'FreeShipping') NOT NULL,
  `discount_value` decimal(10, 2) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `product_id` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `coupons_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE
  SET
  NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: orderitems
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `orderitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT '1',
  `unit_price` decimal(10, 2) NOT NULL,
  `subtotal` decimal(10, 2) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: orders
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `petOwner_id` int NOT NULL,
  `total_amount` decimal(10, 2) NOT NULL,
  `status` enum(
  'Đang xử lý',
  'Chờ thanh toán',
  'Hoàn thành',
  'Hủy',
  'Đã giao',
  'Đang vận chuyển'
  ) DEFAULT 'Đang xử lý',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `petOwner_id` (`petOwner_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`petOwner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: payments
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `amount` decimal(10, 2) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `status` enum(
  'Đang xử lý',
  'Hoàn thành',
  'Hủy',
  'Đã giao',
  'Đang vận chuyển',
  'Chờ xác nhận',
  'Chờ xử lý',
  'Chờ thanh toán'
  ) DEFAULT 'Đang xử lý',
  `transaction_id` varchar(100) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: pets
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `pets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `breed` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` enum('Cái', 'Đực') NOT NULL,
  `description` text,
  `medical_history` text,
  `is_active` tinyint(1) DEFAULT '1',
  `images` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pets_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: posts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `petOwner_Id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `counterLike` int NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `petOwner_Id` (`petOwner_Id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`petOwner_Id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: products
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sales_center_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10, 2) NOT NULL,
  `stock_quantity` int DEFAULT '0',
  `sku` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `images` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `sales_center_id` (`sales_center_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`sales_center_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: reviews
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `petOwner_Id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `rating` tinyint NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `comment` text,
  `is_verified_purchase` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `reviewer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `petOwner_Id` (`petOwner_Id`),
  KEY `product_id` (`product_id`),
  KEY `reviewer_id` (`reviewer_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`petOwner_Id`) REFERENCES `users` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`id`) ON DELETE
  SET
  NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `gender` varchar(8) DEFAULT 'Nam',
  `role` json NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_verified` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_expires_at` datetime DEFAULT NULL,
  `verification_token` varchar(255) DEFAULT NULL,
  `verification_token_expires_at` datetime DEFAULT NULL,
  `cccd` varchar(12) DEFAULT NULL,
  `cccd_front_image` varchar(255) DEFAULT NULL,
  `cccd_back_image` varchar(255) DEFAULT NULL,
  `clinic_address` varchar(255) DEFAULT NULL,
  `practice_certificate` varchar(100) DEFAULT NULL,
  `experience_years` int DEFAULT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL,
  `doctor_avatar` varchar(255) DEFAULT NULL,
  `certificate_image` varchar(255) DEFAULT NULL,
  `is_doctor_approved` tinyint(1) DEFAULT '0',
  `store_name` varchar(100) DEFAULT NULL,
  `store_address` varchar(255) DEFAULT NULL,
  `business_license` varchar(100) DEFAULT NULL,
  `store_logo` varchar(255) DEFAULT NULL,
  `business_license_url` varchar(255) DEFAULT NULL,
  `store_description` text,
  `is_store_verified` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `users_email` (`email`),
  UNIQUE KEY `users_username` (`username`),
  KEY `users_is_active` (`is_active`),
  KEY `users_is_verified` (`is_verified`)
) ENGINE = InnoDB AUTO_INCREMENT = 14 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: appointments
# ------------------------------------------------------------

INSERT INTO
  `appointments` (
    `id`,
    `pet_owner_id`,
    `pet_id`,
    `doctor_id`,
    `appointment_date`,
    `appointment_time`,
    `status`,
    `notes`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    3,
    1,
    1,
    '2024-11-05 00:00:00',
    '09:00:00',
    'Đã đặt lịch',
    'Khám sức khỏe định kỳ cho Lucky',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `appointments` (
    `id`,
    `pet_owner_id`,
    `pet_id`,
    `doctor_id`,
    `appointment_date`,
    `appointment_time`,
    `status`,
    `notes`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    4,
    2,
    5,
    '2024-11-06 00:00:00',
    '14:30:00',
    'Đã đặt lịch',
    'Kiểm tra sức khỏe cho Miu',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `appointments` (
    `id`,
    `pet_owner_id`,
    `pet_id`,
    `doctor_id`,
    `appointment_date`,
    `appointment_time`,
    `status`,
    `notes`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    7,
    3,
    1,
    '2024-11-07 00:00:00',
    '11:00:00',
    'Đã đặt lịch',
    'Tiêm phòng cho Bông',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `appointments` (
    `id`,
    `pet_owner_id`,
    `pet_id`,
    `doctor_id`,
    `appointment_date`,
    `appointment_time`,
    `status`,
    `notes`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    10,
    4,
    9,
    '2024-11-08 00:00:00',
    '16:00:00',
    'Đã đặt lịch',
    'Khám răng cho Nhi',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `appointments` (
    `id`,
    `pet_owner_id`,
    `pet_id`,
    `doctor_id`,
    `appointment_date`,
    `appointment_time`,
    `status`,
    `notes`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    3,
    5,
    1,
    '2024-11-09 00:00:00',
    '10:00:00',
    'Đã đặt lịch',
    'Kiểm tra sức khỏe cho Chích Chòe',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `appointments` (
    `id`,
    `pet_owner_id`,
    `pet_id`,
    `doctor_id`,
    `appointment_date`,
    `appointment_time`,
    `status`,
    `notes`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    4,
    6,
    5,
    '2024-11-10 00:00:00',
    '13:30:00',
    'Đã đặt lịch',
    'Khám bệnh cho Kỳ Nhông',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `appointments` (
    `id`,
    `pet_owner_id`,
    `pet_id`,
    `doctor_id`,
    `appointment_date`,
    `appointment_time`,
    `status`,
    `notes`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    7,
    7,
    1,
    '2024-11-11 00:00:00',
    '15:00:00',
    'Đã đặt lịch',
    'Tiêm phòng cho Rex',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `appointments` (
    `id`,
    `pet_owner_id`,
    `pet_id`,
    `doctor_id`,
    `appointment_date`,
    `appointment_time`,
    `status`,
    `notes`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    10,
    8,
    9,
    '2024-11-12 00:00:00',
    '08:30:00',
    'Đã đặt lịch',
    'Khám sức khỏe cho Mèo Mun',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `appointments` (
    `id`,
    `pet_owner_id`,
    `pet_id`,
    `doctor_id`,
    `appointment_date`,
    `appointment_time`,
    `status`,
    `notes`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    3,
    9,
    1,
    '2024-11-13 00:00:00',
    '14:00:00',
    'Đã đặt lịch',
    'Kiểm tra sức khỏe cho Vành Khuyên',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `appointments` (
    `id`,
    `pet_owner_id`,
    `pet_id`,
    `doctor_id`,
    `appointment_date`,
    `appointment_time`,
    `status`,
    `notes`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    4,
    10,
    5,
    '2024-11-14 00:00:00',
    '09:30:00',
    'Đã đặt lịch',
    'Khám định kỳ cho Bé Tròn',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: categories
# ------------------------------------------------------------

INSERT INTO
  `categories` (
    `id`,
    `name`,
    `type`,
    `is_active`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    'Chó',
    'Thú cưng',
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `categories` (
    `id`,
    `name`,
    `type`,
    `is_active`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    'Mèo',
    'Thú cưng',
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `categories` (
    `id`,
    `name`,
    `type`,
    `is_active`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    'Chích ngừa',
    'Dịch vụ',
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `categories` (
    `id`,
    `name`,
    `type`,
    `is_active`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    'Chăm sóc lông',
    'Dịch vụ',
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `categories` (
    `id`,
    `name`,
    `type`,
    `is_active`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    'Thức ăn',
    'Sản phẩm',
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `categories` (
    `id`,
    `name`,
    `type`,
    `is_active`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    'Đồ chơi',
    'Sản phẩm',
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `categories` (
    `id`,
    `name`,
    `type`,
    `is_active`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    'Thực phẩm bổ sung',
    'Sản phẩm',
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `categories` (
    `id`,
    `name`,
    `type`,
    `is_active`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    'Chim cảnh',
    'Thú cưng',
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `categories` (
    `id`,
    `name`,
    `type`,
    `is_active`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    'Bò sát',
    'Thú cưng',
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `categories` (
    `id`,
    `name`,
    `type`,
    `is_active`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    'Phụ kiện',
    'Sản phẩm',
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: comments
# ------------------------------------------------------------

INSERT INTO
  `comments` (
    `id`,
    `post_id`,
    `petOwner_Id`,
    `content`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    1,
    4,
    'Cảm ơn bạn đã chia sẻ kinh nghiệm hữu ích!',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `comments` (
    `id`,
    `post_id`,
    `petOwner_Id`,
    `content`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    2,
    3,
    'Mình cũng nuôi mèo, rất đồng cảm với bạn!',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `comments` (
    `id`,
    `post_id`,
    `petOwner_Id`,
    `content`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    3,
    7,
    'Thật tuyệt! Chó của bạn rất đáng yêu!',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `comments` (
    `id`,
    `post_id`,
    `petOwner_Id`,
    `content`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    4,
    10,
    'Chăm sóc chim đúng cách sẽ giúp chúng sống lâu hơn.',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `comments` (
    `id`,
    `post_id`,
    `petOwner_Id`,
    `content`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    5,
    4,
    'Thực phẩm bổ sung thực sự quan trọng cho sức khỏe thú cưng.',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `comments` (
    `id`,
    `post_id`,
    `petOwner_Id`,
    `content`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    6,
    3,
    'Mèo của tôi cũng thích đồ chơi này, rất vui nhộn!',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `comments` (
    `id`,
    `post_id`,
    `petOwner_Id`,
    `content`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    7,
    10,
    'Rottweiler của bạn rất khỏe mạnh và trung thành.',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `comments` (
    `id`,
    `post_id`,
    `petOwner_Id`,
    `content`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    8,
    7,
    'Cảm ơn đã chia sẻ kinh nghiệm chăm sóc kỳ nhông.',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `comments` (
    `id`,
    `post_id`,
    `petOwner_Id`,
    `content`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    9,
    4,
    'Chim vành khuyên rất đáng yêu, cảm ơn bạn!',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `comments` (
    `id`,
    `post_id`,
    `petOwner_Id`,
    `content`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    10,
    3,
    'Rùa cạn cần môi trường sống đặc biệt, cảm ơn bạn đã chia sẻ.',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: coupons
# ------------------------------------------------------------

INSERT INTO
  `coupons` (
    `id`,
    `code`,
    `description`,
    `discount_type`,
    `discount_value`,
    `start_date`,
    `end_date`,
    `is_active`,
    `product_id`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    'GIAM10',
    'Giảm 10% cho tất cả sản phẩm',
    'Percentage',
    10.00,
    '2024-10-01 00:00:00',
    '2024-12-31 00:00:00',
    1,
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `coupons` (
    `id`,
    `code`,
    `description`,
    `discount_type`,
    `discount_value`,
    `start_date`,
    `end_date`,
    `is_active`,
    `product_id`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    'GIAM15',
    'Giảm 15% cho đơn hàng trên 500.000đ',
    'Percentage',
    15.00,
    '2024-11-01 00:00:00',
    '2024-11-30 00:00:00',
    1,
    2,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `coupons` (
    `id`,
    `code`,
    `description`,
    `discount_type`,
    `discount_value`,
    `start_date`,
    `end_date`,
    `is_active`,
    `product_id`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    'GIAM20',
    'Giảm 20% cho khách hàng mới',
    'Percentage',
    20.00,
    '2024-10-15 00:00:00',
    '2024-12-15 00:00:00',
    1,
    3,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `coupons` (
    `id`,
    `code`,
    `description`,
    `discount_type`,
    `discount_value`,
    `start_date`,
    `end_date`,
    `is_active`,
    `product_id`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    'FREESHIP',
    'Miễn phí vận chuyển cho đơn hàng trên 300.000đ',
    'FreeShipping',
    0.00,
    '2024-11-01 00:00:00',
    '2024-11-30 00:00:00',
    1,
    NULL,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `coupons` (
    `id`,
    `code`,
    `description`,
    `discount_type`,
    `discount_value`,
    `start_date`,
    `end_date`,
    `is_active`,
    `product_id`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    'SALE50',
    'Giảm 50% cho sản phẩm đồ chơi cho mèo',
    'Percentage',
    50.00,
    '2024-10-01 00:00:00',
    '2024-10-31 00:00:00',
    1,
    2,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `coupons` (
    `id`,
    `code`,
    `description`,
    `discount_type`,
    `discount_value`,
    `start_date`,
    `end_date`,
    `is_active`,
    `product_id`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    'GIAM5',
    'Giảm 5% cho tất cả đơn hàng',
    'Percentage',
    5.00,
    '2024-10-01 00:00:00',
    '2024-12-31 00:00:00',
    1,
    NULL,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `coupons` (
    `id`,
    `code`,
    `description`,
    `discount_type`,
    `discount_value`,
    `start_date`,
    `end_date`,
    `is_active`,
    `product_id`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    'MEMBER10',
    'Giảm 10% cho thành viên VIP',
    'Percentage',
    10.00,
    '2024-11-01 00:00:00',
    '2024-12-31 00:00:00',
    1,
    NULL,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `coupons` (
    `id`,
    `code`,
    `description`,
    `discount_type`,
    `discount_value`,
    `start_date`,
    `end_date`,
    `is_active`,
    `product_id`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    'BLACKFRI',
    'Giảm 30% cho ngày Black Friday',
    'Percentage',
    30.00,
    '2024-11-25 00:00:00',
    '2024-11-25 00:00:00',
    1,
    NULL,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `coupons` (
    `id`,
    `code`,
    `description`,
    `discount_type`,
    `discount_value`,
    `start_date`,
    `end_date`,
    `is_active`,
    `product_id`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    'XMAS25',
    'Giảm 25% cho mùa Giáng sinh',
    'Percentage',
    25.00,
    '2024-12-01 00:00:00',
    '2024-12-25 00:00:00',
    1,
    NULL,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `coupons` (
    `id`,
    `code`,
    `description`,
    `discount_type`,
    `discount_value`,
    `start_date`,
    `end_date`,
    `is_active`,
    `product_id`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    'NEWYEAR',
    'Giảm 15% cho dịp Năm Mới',
    'Percentage',
    15.00,
    '2024-12-30 00:00:00',
    '2025-01-05 00:00:00',
    1,
    NULL,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: orderitems
# ------------------------------------------------------------

INSERT INTO
  `orderitems` (
    `id`,
    `order_id`,
    `product_id`,
    `quantity`,
    `unit_price`,
    `subtotal`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    1,
    1,
    1,
    300000.00,
    300000.00,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orderitems` (
    `id`,
    `order_id`,
    `product_id`,
    `quantity`,
    `unit_price`,
    `subtotal`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    2,
    2,
    1,
    120000.00,
    120000.00,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orderitems` (
    `id`,
    `order_id`,
    `product_id`,
    `quantity`,
    `unit_price`,
    `subtotal`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    3,
    4,
    1,
    180000.00,
    180000.00,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orderitems` (
    `id`,
    `order_id`,
    `product_id`,
    `quantity`,
    `unit_price`,
    `subtotal`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    4,
    5,
    1,
    70000.00,
    70000.00,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orderitems` (
    `id`,
    `order_id`,
    `product_id`,
    `quantity`,
    `unit_price`,
    `subtotal`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    5,
    6,
    1,
    220000.00,
    220000.00,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orderitems` (
    `id`,
    `order_id`,
    `product_id`,
    `quantity`,
    `unit_price`,
    `subtotal`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    6,
    7,
    1,
    100000.00,
    100000.00,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orderitems` (
    `id`,
    `order_id`,
    `product_id`,
    `quantity`,
    `unit_price`,
    `subtotal`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    7,
    8,
    1,
    90000.00,
    90000.00,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orderitems` (
    `id`,
    `order_id`,
    `product_id`,
    `quantity`,
    `unit_price`,
    `subtotal`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    8,
    9,
    1,
    150000.00,
    150000.00,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orderitems` (
    `id`,
    `order_id`,
    `product_id`,
    `quantity`,
    `unit_price`,
    `subtotal`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    9,
    10,
    1,
    300000.00,
    300000.00,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orderitems` (
    `id`,
    `order_id`,
    `product_id`,
    `quantity`,
    `unit_price`,
    `subtotal`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    10,
    3,
    1,
    250000.00,
    250000.00,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orderitems` (
    `id`,
    `order_id`,
    `product_id`,
    `quantity`,
    `unit_price`,
    `subtotal`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    11,
    11,
    1,
    1,
    300000.00,
    300000.00,
    '2024-11-21 02:32:54',
    '2024-11-21 02:32:54'
  );
INSERT INTO
  `orderitems` (
    `id`,
    `order_id`,
    `product_id`,
    `quantity`,
    `unit_price`,
    `subtotal`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    12,
    12,
    1,
    1,
    300000.00,
    300000.00,
    '2024-11-21 03:11:03',
    '2024-11-21 03:11:03'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: orders
# ------------------------------------------------------------

INSERT INTO
  `orders` (
    `id`,
    `petOwner_id`,
    `total_amount`,
    `status`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    3,
    300000.00,
    'Đang xử lý',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orders` (
    `id`,
    `petOwner_id`,
    `total_amount`,
    `status`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    4,
    120000.00,
    'Chờ thanh toán',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orders` (
    `id`,
    `petOwner_id`,
    `total_amount`,
    `status`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    7,
    180000.00,
    'Hoàn thành',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orders` (
    `id`,
    `petOwner_id`,
    `total_amount`,
    `status`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    10,
    70000.00,
    'Hủy',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orders` (
    `id`,
    `petOwner_id`,
    `total_amount`,
    `status`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    3,
    220000.00,
    'Đang xử lý',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orders` (
    `id`,
    `petOwner_id`,
    `total_amount`,
    `status`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    4,
    100000.00,
    'Hoàn thành',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orders` (
    `id`,
    `petOwner_id`,
    `total_amount`,
    `status`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    7,
    90000.00,
    'Đã giao',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orders` (
    `id`,
    `petOwner_id`,
    `total_amount`,
    `status`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    10,
    150000.00,
    'Đã giao',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orders` (
    `id`,
    `petOwner_id`,
    `total_amount`,
    `status`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    3,
    300000.00,
    'Đang vận chuyển',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orders` (
    `id`,
    `petOwner_id`,
    `total_amount`,
    `status`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    4,
    250000.00,
    'Chờ thanh toán',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `orders` (
    `id`,
    `petOwner_id`,
    `total_amount`,
    `status`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    11,
    1,
    300000.00,
    'Đang xử lý',
    '2024-11-21 02:32:54',
    '2024-11-21 02:32:54'
  );
INSERT INTO
  `orders` (
    `id`,
    `petOwner_id`,
    `total_amount`,
    `status`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    12,
    1,
    300000.00,
    'Đang xử lý',
    '2024-11-21 03:11:03',
    '2024-11-21 03:11:03'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: payments
# ------------------------------------------------------------

INSERT INTO
  `payments` (
    `id`,
    `order_id`,
    `amount`,
    `payment_method`,
    `status`,
    `transaction_id`,
    `payment_date`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    1,
    300000.00,
    'Thẻ tín dụng',
    'Hoàn thành',
    'TXVN123456',
    '2024-10-15 10:30:00',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `payments` (
    `id`,
    `order_id`,
    `amount`,
    `payment_method`,
    `status`,
    `transaction_id`,
    `payment_date`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    2,
    120000.00,
    'Thẻ tín dụng',
    'Chờ xử lý',
    'TXVN654321',
    '2024-10-16 11:00:00',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `payments` (
    `id`,
    `order_id`,
    `amount`,
    `payment_method`,
    `status`,
    `transaction_id`,
    `payment_date`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    3,
    180000.00,
    'Thẻ tín dụngt',
    'Hoàn thành',
    'TXVN789012',
    '2024-10-17 09:45:00',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `payments` (
    `id`,
    `order_id`,
    `amount`,
    `payment_method`,
    `status`,
    `transaction_id`,
    `payment_date`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    4,
    70000.00,
    'Thẻ tín dụng',
    'Hủy',
    'TXVN345678',
    '2024-10-18 13:15:00',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `payments` (
    `id`,
    `order_id`,
    `amount`,
    `payment_method`,
    `status`,
    `transaction_id`,
    `payment_date`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    5,
    220000.00,
    'Thẻ tín dụng',
    'Đang xử lý',
    'TXVN901234',
    '2024-10-19 08:20:00',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `payments` (
    `id`,
    `order_id`,
    `amount`,
    `payment_method`,
    `status`,
    `transaction_id`,
    `payment_date`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    6,
    100000.00,
    'Thẻ tín dụng',
    'Hoàn thành',
    'TXVN567890',
    '2024-10-20 15:00:00',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `payments` (
    `id`,
    `order_id`,
    `amount`,
    `payment_method`,
    `status`,
    `transaction_id`,
    `payment_date`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    7,
    90000.00,
    'Thẻ tín dụng',
    'Chờ xác nhận',
    'TXVN234567',
    '2024-10-21 16:45:00',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `payments` (
    `id`,
    `order_id`,
    `amount`,
    `payment_method`,
    `status`,
    `transaction_id`,
    `payment_date`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    8,
    150000.00,
    'Thẻ tín dụng',
    'Đã giao',
    'TXVN678901',
    '2024-10-22 17:30:00',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `payments` (
    `id`,
    `order_id`,
    `amount`,
    `payment_method`,
    `status`,
    `transaction_id`,
    `payment_date`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    9,
    300000.00,
    'Thẻ tín dụng',
    'Đang vận chuyển',
    'TXVN890123',
    '2024-10-23 14:10:00',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `payments` (
    `id`,
    `order_id`,
    `amount`,
    `payment_method`,
    `status`,
    `transaction_id`,
    `payment_date`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    10,
    250000.00,
    'Thẻ tín dụng',
    'Chờ thanh toán',
    'TXVN456789',
    '2024-10-24 19:00:00',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `payments` (
    `id`,
    `order_id`,
    `amount`,
    `payment_method`,
    `status`,
    `transaction_id`,
    `payment_date`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    11,
    11,
    300000.00,
    'Credit Card',
    'Đang xử lý',
    'cs_test_a1gnLVDXd9ImPIxtdn6gDXtd4kw0hMrUQCySMJxnERJ1wVBj3uGgtZX7Wq',
    '2024-11-21 02:32:55',
    '2024-11-21 02:32:55',
    '2024-11-21 02:32:55'
  );
INSERT INTO
  `payments` (
    `id`,
    `order_id`,
    `amount`,
    `payment_method`,
    `status`,
    `transaction_id`,
    `payment_date`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    12,
    12,
    300000.00,
    'Credit Card',
    'Đang xử lý',
    'cs_test_a1mJZKs9vSVU4sberidyCDfAVXhIwdbOepKjhd10peXpQke9HGu23ZJRgR',
    '2024-11-21 03:11:05',
    '2024-11-21 03:11:05',
    '2024-11-21 03:11:05'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: pets
# ------------------------------------------------------------

INSERT INTO
  `pets` (
    `id`,
    `owner_id`,
    `category_id`,
    `name`,
    `breed`,
    `age`,
    `gender`,
    `description`,
    `medical_history`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    3,
    1,
    'Lucky',
    'Phốc Sóc',
    2,
    'Đực',
    'Thân thiện và năng động',
    'Chích ngừa đầy đủ',
    1,
    'https://example.com/lucky_phoc_soc.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `pets` (
    `id`,
    `owner_id`,
    `category_id`,
    `name`,
    `breed`,
    `age`,
    `gender`,
    `description`,
    `medical_history`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    4,
    2,
    'Miu',
    'Mèo Ba Tư',
    3,
    'Cái',
    'Trầm tĩnh, thích yên tĩnh',
    'Đã chích ngừa dại',
    1,
    'https://example.com/miu_ba_tu.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `pets` (
    `id`,
    `owner_id`,
    `category_id`,
    `name`,
    `breed`,
    `age`,
    `gender`,
    `description`,
    `medical_history`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    7,
    1,
    'Bông',
    'Chihuahua',
    1,
    'Đực',
    'Rất thông minh và đáng yêu',
    'Chích ngừa sổ giun',
    1,
    'https://example.com/bong_chihuahua.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `pets` (
    `id`,
    `owner_id`,
    `category_id`,
    `name`,
    `breed`,
    `age`,
    `gender`,
    `description`,
    `medical_history`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    10,
    2,
    'Nhi',
    'Mèo Anh Lông Ngắn',
    4,
    'Cái',
    'Thích chơi đùa',
    'Đã chích ngừa',
    1,
    'https://example.com/nhi_aln.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `pets` (
    `id`,
    `owner_id`,
    `category_id`,
    `name`,
    `breed`,
    `age`,
    `gender`,
    `description`,
    `medical_history`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    3,
    8,
    'Chích Chòe',
    'Chim cảnh',
    1,
    'Đực',
    'Hót rất hay',
    'Không có bệnh',
    1,
    'https://example.com/chich_choe.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `pets` (
    `id`,
    `owner_id`,
    `category_id`,
    `name`,
    `breed`,
    `age`,
    `gender`,
    `description`,
    `medical_history`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    4,
    9,
    'Kỳ Nhông',
    'Rồng Úc',
    2,
    'Đực',
    'Thân thiện với trẻ em',
    'Kiểm tra sức khỏe thường xuyên',
    1,
    'https://example.com/ky_nhong.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `pets` (
    `id`,
    `owner_id`,
    `category_id`,
    `name`,
    `breed`,
    `age`,
    `gender`,
    `description`,
    `medical_history`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    7,
    1,
    'Rex',
    'Rottweiler',
    3,
    'Đực',
    'Bảo vệ tốt, trung thành',
    'Đã tiêm phòng dại',
    1,
    'https://example.com/rex_rottweiler.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `pets` (
    `id`,
    `owner_id`,
    `category_id`,
    `name`,
    `breed`,
    `age`,
    `gender`,
    `description`,
    `medical_history`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    10,
    2,
    'Mèo Mun',
    'Mèo Ta',
    2,
    'Cái',
    'Thích săn bắt chuột',
    'Không có bệnh',
    1,
    'https://example.com/meo_mun.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `pets` (
    `id`,
    `owner_id`,
    `category_id`,
    `name`,
    `breed`,
    `age`,
    `gender`,
    `description`,
    `medical_history`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    4,
    8,
    'Vành Khuyên',
    'Chim Vành Khuyên',
    1,
    'Đực',
    'Rất nhanh nhẹn',
    'Không có bệnh',
    1,
    'https://example.com/vanh_khuyen.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `pets` (
    `id`,
    `owner_id`,
    `category_id`,
    `name`,
    `breed`,
    `age`,
    `gender`,
    `description`,
    `medical_history`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    3,
    9,
    'Bé Tròn',
    'Rùa Cạn',
    5,
    'Cái',
    'Rất hiền lành',
    'Khám định kỳ hàng năm',
    1,
    'https://example.com/rua_can.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: posts
# ------------------------------------------------------------

INSERT INTO
  `posts` (
    `id`,
    `petOwner_Id`,
    `title`,
    `content`,
    `image_url`,
    `counterLike`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    3,
    'Chia sẻ kinh nghiệm nuôi chó',
    'Chó của tôi rất đáng yêu và dễ thương...',
    'https://example.com/post1.jpg',
    15,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `posts` (
    `id`,
    `petOwner_Id`,
    `title`,
    `content`,
    `image_url`,
    `counterLike`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    4,
    'Kinh nghiệm chăm sóc mèo lông dài',
    'Mèo cần phải chải lông thường xuyên để giữ sạch sẽ...',
    'https://example.com/post2.jpg',
    22,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `posts` (
    `id`,
    `petOwner_Id`,
    `title`,
    `content`,
    `image_url`,
    `counterLike`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    7,
    'Chơi với cún cưng hàng ngày',
    'Mỗi ngày chơi với cún giúp tăng sự gắn kết...',
    'https://example.com/post3.jpg',
    18,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `posts` (
    `id`,
    `petOwner_Id`,
    `title`,
    `content`,
    `image_url`,
    `counterLike`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    10,
    'Chăm sóc chim cảnh',
    'Chim cần môi trường sạch và thức ăn phù hợp...',
    'https://example.com/post4.jpg',
    20,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `posts` (
    `id`,
    `petOwner_Id`,
    `title`,
    `content`,
    `image_url`,
    `counterLike`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    3,
    'Lợi ích của thực phẩm bổ sung',
    'Thực phẩm bổ sung giúp thú cưng khỏe mạnh hơn...',
    'https://example.com/post5.jpg',
    10,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `posts` (
    `id`,
    `petOwner_Id`,
    `title`,
    `content`,
    `image_url`,
    `counterLike`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    4,
    'Cách chọn đồ chơi cho mèo',
    'Đồ chơi phù hợp giúp mèo giảm stress và tăng vận động...',
    'https://example.com/post6.jpg',
    25,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `posts` (
    `id`,
    `petOwner_Id`,
    `title`,
    `content`,
    `image_url`,
    `counterLike`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    7,
    'Bí quyết nuôi Rottweiler',
    'Rottweiler rất trung thành và bảo vệ tốt...',
    'https://example.com/post7.jpg',
    30,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `posts` (
    `id`,
    `petOwner_Id`,
    `title`,
    `content`,
    `image_url`,
    `counterLike`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    10,
    'Chăm sóc kỳ nhông',
    'Kỳ nhông cần được kiểm tra sức khỏe định kỳ...',
    'https://example.com/post8.jpg',
    12,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `posts` (
    `id`,
    `petOwner_Id`,
    `title`,
    `content`,
    `image_url`,
    `counterLike`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    3,
    'Bí quyết nuôi chim vành khuyên',
    'Chim vành khuyên rất năng động và cần môi trường sạch...',
    'https://example.com/post9.jpg',
    18,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `posts` (
    `id`,
    `petOwner_Id`,
    `title`,
    `content`,
    `image_url`,
    `counterLike`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    4,
    'Làm sao để chăm sóc rùa cạn?',
    'Rùa cạn cần chế độ ăn đặc biệt và môi trường thích hợp...',
    'https://example.com/post10.jpg',
    22,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: products
# ------------------------------------------------------------

INSERT INTO
  `products` (
    `id`,
    `sales_center_id`,
    `category_id`,
    `name`,
    `description`,
    `price`,
    `stock_quantity`,
    `sku`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    2,
    5,
    'Thức ăn cao cấp cho chó',
    'Dinh dưỡng đầy đủ cho chó mọi lứa tuổi',
    300000.00,
    148,
    'DOGFOOD_VN0012',
    1,
    'https://example.com/dogfood_vn1.jpg',
    '2024-11-20 12:45:22',
    '2024-11-21 03:11:03'
  );
INSERT INTO
  `products` (
    `id`,
    `sales_center_id`,
    `category_id`,
    `name`,
    `description`,
    `price`,
    `stock_quantity`,
    `sku`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    6,
    6,
    'Đồ chơi thông minh cho mèo',
    'Giúp mèo hoạt động và giảm căng thẳng',
    120000.00,
    80,
    'CATTOY_VN0013',
    1,
    'https://example.com/cattoy_vn1.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `products` (
    `id`,
    `sales_center_id`,
    `category_id`,
    `name`,
    `description`,
    `price`,
    `stock_quantity`,
    `sku`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    2,
    5,
    'Thức ăn cho mèo lông dài',
    'Bổ sung Omega 3 và 6 cho lông mượt',
    250000.00,
    100,
    'CATFOOD_VN0014',
    1,
    'https://example.com/catfood_vn1.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `products` (
    `id`,
    `sales_center_id`,
    `category_id`,
    `name`,
    `description`,
    `price`,
    `stock_quantity`,
    `sku`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    6,
    7,
    'Vitamin tổng hợp cho thú cưng',
    'Giúp thú cưng khỏe mạnh hơn',
    180000.00,
    200,
    'VITAMIN_VN0015',
    1,
    'https://example.com/vitamin_vn1.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `products` (
    `id`,
    `sales_center_id`,
    `category_id`,
    `name`,
    `description`,
    `price`,
    `stock_quantity`,
    `sku`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    2,
    6,
    'Bóng đồ chơi cho chó',
    'Chất liệu cao su bền, an toàn',
    70000.00,
    300,
    'DOGTOY_VN0016',
    1,
    'https://example.com/dogtoy_vn1.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `products` (
    `id`,
    `sales_center_id`,
    `category_id`,
    `name`,
    `description`,
    `price`,
    `stock_quantity`,
    `sku`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    6,
    7,
    'Omega 3 cho chó',
    'Giúp da và lông khỏe mạnh',
    220000.00,
    120,
    'OMEGA_VN0017',
    1,
    'https://example.com/omega_vn1.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `products` (
    `id`,
    `sales_center_id`,
    `category_id`,
    `name`,
    `description`,
    `price`,
    `stock_quantity`,
    `sku`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    2,
    5,
    'Thức ăn hạt cho chim',
    'Dinh dưỡng cân đối cho các loại chim',
    100000.00,
    50,
    'BIRDFOOD_VN0018',
    1,
    'https://example.com/birdfood_vn1.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `products` (
    `id`,
    `sales_center_id`,
    `category_id`,
    `name`,
    `description`,
    `price`,
    `stock_quantity`,
    `sku`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    6,
    10,
    'Dây dắt chó',
    'Chất liệu nylon bền bỉ',
    90000.00,
    200,
    'LEASH_VN0019',
    1,
    'https://example.com/leash_vn1.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `products` (
    `id`,
    `sales_center_id`,
    `category_id`,
    `name`,
    `description`,
    `price`,
    `stock_quantity`,
    `sku`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    2,
    7,
    'Bột canxi cho chó mèo',
    'Bổ sung canxi giúp xương chắc khỏe',
    150000.00,
    90,
    'CALCIUM_VN00110',
    1,
    'https://example.com/calcium_vn1.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `products` (
    `id`,
    `sales_center_id`,
    `category_id`,
    `name`,
    `description`,
    `price`,
    `stock_quantity`,
    `sku`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    6,
    6,
    'Mèo cào',
    'Giúp mèo mài móng, giảm căng thẳng',
    300000.00,
    60,
    'CATSCRATCH_VN00111',
    1,
    'https://example.com/catscratch_vn1.jpg',
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `products` (
    `id`,
    `sales_center_id`,
    `category_id`,
    `name`,
    `description`,
    `price`,
    `stock_quantity`,
    `sku`,
    `is_active`,
    `images`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    11,
    1,
    4,
    'Product A',
    'Test product description',
    100.00,
    50,
    'PRD001',
    1,
    'https://product.hstatic.net/200000263355/product/z4431095005129_5ae326bc61106bba8c85799a3e176128_f58eeb18c4fb45898b2283344b1c7cf5_master.jpg',
    '2024-11-20 09:08:31',
    '2024-11-20 09:08:31'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: reviews
# ------------------------------------------------------------

INSERT INTO
  `reviews` (
    `id`,
    `petOwner_Id`,
    `product_id`,
    `rating`,
    `title`,
    `comment`,
    `is_verified_purchase`,
    `createdAt`,
    `updatedAt`,
    `reviewer_id`
  )
VALUES
  (
    1,
    3,
    1,
    5,
    'Chất lượng tuyệt vời',
    'Sản phẩm rất tốt, chó của tôi rất thích!',
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22',
    NULL
  );
INSERT INTO
  `reviews` (
    `id`,
    `petOwner_Id`,
    `product_id`,
    `rating`,
    `title`,
    `comment`,
    `is_verified_purchase`,
    `createdAt`,
    `updatedAt`,
    `reviewer_id`
  )
VALUES
  (
    2,
    4,
    2,
    4,
    'Sản phẩm ổn',
    'Đồ chơi khá tốt, nhưng màu sắc hơi phai.',
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22',
    NULL
  );
INSERT INTO
  `reviews` (
    `id`,
    `petOwner_Id`,
    `product_id`,
    `rating`,
    `title`,
    `comment`,
    `is_verified_purchase`,
    `createdAt`,
    `updatedAt`,
    `reviewer_id`
  )
VALUES
  (
    3,
    7,
    4,
    5,
    'Vitamin tuyệt vời',
    'Sau khi dùng vitamin, thú cưng của tôi khỏe hơn rất nhiều.',
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22',
    NULL
  );
INSERT INTO
  `reviews` (
    `id`,
    `petOwner_Id`,
    `product_id`,
    `rating`,
    `title`,
    `comment`,
    `is_verified_purchase`,
    `createdAt`,
    `updatedAt`,
    `reviewer_id`
  )
VALUES
  (
    4,
    10,
    5,
    3,
    'Sản phẩm tạm được',
    'Dây dắt hơi nhỏ, phù hợp cho chó nhỏ.',
    0,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22',
    NULL
  );
INSERT INTO
  `reviews` (
    `id`,
    `petOwner_Id`,
    `product_id`,
    `rating`,
    `title`,
    `comment`,
    `is_verified_purchase`,
    `createdAt`,
    `updatedAt`,
    `reviewer_id`
  )
VALUES
  (
    5,
    3,
    6,
    4,
    'Khá hài lòng',
    'Sản phẩm giúp lông chó của tôi mượt mà hơn.',
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22',
    NULL
  );
INSERT INTO
  `reviews` (
    `id`,
    `petOwner_Id`,
    `product_id`,
    `rating`,
    `title`,
    `comment`,
    `is_verified_purchase`,
    `createdAt`,
    `updatedAt`,
    `reviewer_id`
  )
VALUES
  (
    6,
    4,
    7,
    5,
    'Chất lượng rất tốt',
    'Thức ăn cho chim rất phù hợp, chim của tôi rất thích.',
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22',
    NULL
  );
INSERT INTO
  `reviews` (
    `id`,
    `petOwner_Id`,
    `product_id`,
    `rating`,
    `title`,
    `comment`,
    `is_verified_purchase`,
    `createdAt`,
    `updatedAt`,
    `reviewer_id`
  )
VALUES
  (
    7,
    7,
    8,
    4,
    'Đáng mua',
    'Dây dắt chó bền, tuy nhiên giá hơi cao.',
    0,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22',
    NULL
  );
INSERT INTO
  `reviews` (
    `id`,
    `petOwner_Id`,
    `product_id`,
    `rating`,
    `title`,
    `comment`,
    `is_verified_purchase`,
    `createdAt`,
    `updatedAt`,
    `reviewer_id`
  )
VALUES
  (
    8,
    10,
    9,
    5,
    'Tuyệt vời',
    'Bổ sung canxi thực sự hiệu quả.',
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22',
    NULL
  );
INSERT INTO
  `reviews` (
    `id`,
    `petOwner_Id`,
    `product_id`,
    `rating`,
    `title`,
    `comment`,
    `is_verified_purchase`,
    `createdAt`,
    `updatedAt`,
    `reviewer_id`
  )
VALUES
  (
    9,
    3,
    10,
    5,
    'Sản phẩm tuyệt vời',
    'Đồ cào cho mèo cực kỳ chắc chắn và tiện lợi.',
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22',
    NULL
  );
INSERT INTO
  `reviews` (
    `id`,
    `petOwner_Id`,
    `product_id`,
    `rating`,
    `title`,
    `comment`,
    `is_verified_purchase`,
    `createdAt`,
    `updatedAt`,
    `reviewer_id`
  )
VALUES
  (
    10,
    4,
    3,
    4,
    'Thức ăn cho mèo ổn',
    'Mèo của tôi rất thích, nhưng giá hơi cao.',
    1,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: users
# ------------------------------------------------------------

INSERT INTO
  `users` (
    `id`,
    `username`,
    `password`,
    `email`,
    `phone`,
    `gender`,
    `role`,
    `full_name`,
    `date_of_birth`,
    `address`,
    `avatar_url`,
    `is_active`,
    `is_verified`,
    `last_login`,
    `reset_password_token`,
    `reset_password_expires_at`,
    `verification_token`,
    `verification_token_expires_at`,
    `cccd`,
    `cccd_front_image`,
    `cccd_back_image`,
    `clinic_address`,
    `practice_certificate`,
    `experience_years`,
    `opening_time`,
    `closing_time`,
    `doctor_avatar`,
    `certificate_image`,
    `is_doctor_approved`,
    `store_name`,
    `store_address`,
    `business_license`,
    `store_logo`,
    `business_license_url`,
    `store_description`,
    `is_store_verified`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    'doctor_user',
    '$2a$10$Fw4AZsg4cPnnfJsvWpa6Nu//bE4DpqAl8ZLBCWvFWYeNWWSYhVqMi',
    'doctor@example.com',
    '0123456789',
    'Nam',
    '[\"PetOwner\", \"Doctor\"]',
    'Dr. John Doe',
    '1980-05-15',
    '123 Clinic Street',
    'https://example.com/avatar_doctor.jpg',
    1,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '123456789012',
    'https://example.com/cccd_front.jpg',
    'https://example.com/cccd_back.jpg',
    '123 Clinic Street',
    'CERT-2023-001',
    10,
    '08:00:00',
    '17:00:00',
    'https://example.com/doctor_avatar.jpg',
    'https://example.com/certificate.jpg',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2024-11-20 05:45:12',
    '2024-11-20 05:45:12'
  );
INSERT INTO
  `users` (
    `id`,
    `username`,
    `password`,
    `email`,
    `phone`,
    `gender`,
    `role`,
    `full_name`,
    `date_of_birth`,
    `address`,
    `avatar_url`,
    `is_active`,
    `is_verified`,
    `last_login`,
    `reset_password_token`,
    `reset_password_expires_at`,
    `verification_token`,
    `verification_token_expires_at`,
    `cccd`,
    `cccd_front_image`,
    `cccd_back_image`,
    `clinic_address`,
    `practice_certificate`,
    `experience_years`,
    `opening_time`,
    `closing_time`,
    `doctor_avatar`,
    `certificate_image`,
    `is_doctor_approved`,
    `store_name`,
    `store_address`,
    `business_license`,
    `store_logo`,
    `business_license_url`,
    `store_description`,
    `is_store_verified`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    'seller_user',
    '$2a$10$A6v.esH.nZle0lKzsQLnbOoOwY10exnKaakBESC0jzoR0cjwp14YS',
    'seller@example.com',
    '0987654321',
    'Nữ',
    '[\"PetOwner\", \"Seller\"]',
    'Jane Smith',
    '1990-10-20',
    '456 Store Avenue',
    'https://example.com/avatar_seller.jpg',
    1,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    'Pet Paradise',
    '456 Store Avenue',
    'LICENSE-2023-001',
    'https://example.com/store_logo.jpg',
    'https://example.com/business_license.jpg',
    'A store specializing in pet products and supplies.',
    1,
    '2024-11-20 05:45:12',
    '2024-11-20 05:45:12'
  );
INSERT INTO
  `users` (
    `id`,
    `username`,
    `password`,
    `email`,
    `phone`,
    `gender`,
    `role`,
    `full_name`,
    `date_of_birth`,
    `address`,
    `avatar_url`,
    `is_active`,
    `is_verified`,
    `last_login`,
    `reset_password_token`,
    `reset_password_expires_at`,
    `verification_token`,
    `verification_token_expires_at`,
    `cccd`,
    `cccd_front_image`,
    `cccd_back_image`,
    `clinic_address`,
    `practice_certificate`,
    `experience_years`,
    `opening_time`,
    `closing_time`,
    `doctor_avatar`,
    `certificate_image`,
    `is_doctor_approved`,
    `store_name`,
    `store_address`,
    `business_license`,
    `store_logo`,
    `business_license_url`,
    `store_description`,
    `is_store_verified`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    'admin_user',
    '$2a$10$a2nLSEI1SnNkNRQRPhrX7udA4/UwgraS.TsUxffqH/WjR7qniYcc2',
    'admin@example.com',
    '0111222333',
    'Khác',
    '[\"PetOwner\", \"Admin\"]',
    'Admin User',
    '1985-01-01',
    '789 Admin Road',
    'https://example.com/avatar_admin.jpg',
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2024-11-20 05:45:12',
    '2024-11-20 05:45:12'
  );
INSERT INTO
  `users` (
    `id`,
    `username`,
    `password`,
    `email`,
    `phone`,
    `gender`,
    `role`,
    `full_name`,
    `date_of_birth`,
    `address`,
    `avatar_url`,
    `is_active`,
    `is_verified`,
    `last_login`,
    `reset_password_token`,
    `reset_password_expires_at`,
    `verification_token`,
    `verification_token_expires_at`,
    `cccd`,
    `cccd_front_image`,
    `cccd_back_image`,
    `clinic_address`,
    `practice_certificate`,
    `experience_years`,
    `opening_time`,
    `closing_time`,
    `doctor_avatar`,
    `certificate_image`,
    `is_doctor_approved`,
    `store_name`,
    `store_address`,
    `business_license`,
    `store_logo`,
    `business_license_url`,
    `store_description`,
    `is_store_verified`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    'nguyen_van_a',
    'hashedpassword1',
    'nguyenvana@example.com',
    '0909123456',
    'Nam',
    '[\"Doctor\"]',
    'Nguyễn Văn A',
    '1980-02-15',
    '123 Đường ABC, Quận 10, TP.HCM',
    'https://randomuser.me/api/portraits/men/1.jpg',
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '0123456789',
    NULL,
    NULL,
    '456 Clinic Address',
    'Doctor Certificate',
    15,
    '08:00:00',
    '17:00:00',
    'https://randomuser.me/api/portraits/men/2.jpg',
    'https://example.com/certificate1.jpg',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `users` (
    `id`,
    `username`,
    `password`,
    `email`,
    `phone`,
    `gender`,
    `role`,
    `full_name`,
    `date_of_birth`,
    `address`,
    `avatar_url`,
    `is_active`,
    `is_verified`,
    `last_login`,
    `reset_password_token`,
    `reset_password_expires_at`,
    `verification_token`,
    `verification_token_expires_at`,
    `cccd`,
    `cccd_front_image`,
    `cccd_back_image`,
    `clinic_address`,
    `practice_certificate`,
    `experience_years`,
    `opening_time`,
    `closing_time`,
    `doctor_avatar`,
    `certificate_image`,
    `is_doctor_approved`,
    `store_name`,
    `store_address`,
    `business_license`,
    `store_logo`,
    `business_license_url`,
    `store_description`,
    `is_store_verified`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    'tran_thi_b',
    'hashedpassword2',
    'tranthib@example.com',
    '0912345678',
    'Nu',
    '[\"Doctor\"]',
    'Trần Thị B',
    '1985-05-22',
    '456 Đường DEF, Quận 3, TP.HCM',
    'https://randomuser.me/api/portraits/women/3.jpg',
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '9876543210',
    NULL,
    NULL,
    '789 Clinic Address',
    'Doctor Certificate',
    10,
    '09:00:00',
    '18:00:00',
    'https://randomuser.me/api/portraits/women/4.jpg',
    'https://example.com/certificate2.jpg',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `users` (
    `id`,
    `username`,
    `password`,
    `email`,
    `phone`,
    `gender`,
    `role`,
    `full_name`,
    `date_of_birth`,
    `address`,
    `avatar_url`,
    `is_active`,
    `is_verified`,
    `last_login`,
    `reset_password_token`,
    `reset_password_expires_at`,
    `verification_token`,
    `verification_token_expires_at`,
    `cccd`,
    `cccd_front_image`,
    `cccd_back_image`,
    `clinic_address`,
    `practice_certificate`,
    `experience_years`,
    `opening_time`,
    `closing_time`,
    `doctor_avatar`,
    `certificate_image`,
    `is_doctor_approved`,
    `store_name`,
    `store_address`,
    `business_license`,
    `store_logo`,
    `business_license_url`,
    `store_description`,
    `is_store_verified`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    'le_van_c',
    'hashedpassword3',
    'levanc@example.com',
    '0923456789',
    'Nam',
    '[\"Doctor\"]',
    'Lê Văn C',
    '1978-11-10',
    '789 Đường GHI, Quận 5, TP.HCM',
    'https://randomuser.me/api/portraits/men/5.jpg',
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1122334455',
    NULL,
    NULL,
    '123 Clinic Address',
    'Doctor Certificate',
    20,
    '07:00:00',
    '16:00:00',
    'https://randomuser.me/api/portraits/men/6.jpg',
    'https://example.com/certificate3.jpg',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `users` (
    `id`,
    `username`,
    `password`,
    `email`,
    `phone`,
    `gender`,
    `role`,
    `full_name`,
    `date_of_birth`,
    `address`,
    `avatar_url`,
    `is_active`,
    `is_verified`,
    `last_login`,
    `reset_password_token`,
    `reset_password_expires_at`,
    `verification_token`,
    `verification_token_expires_at`,
    `cccd`,
    `cccd_front_image`,
    `cccd_back_image`,
    `clinic_address`,
    `practice_certificate`,
    `experience_years`,
    `opening_time`,
    `closing_time`,
    `doctor_avatar`,
    `certificate_image`,
    `is_doctor_approved`,
    `store_name`,
    `store_address`,
    `business_license`,
    `store_logo`,
    `business_license_url`,
    `store_description`,
    `is_store_verified`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    'pham_thi_d',
    'hashedpassword4',
    'phamthid@example.com',
    '0934567890',
    'Nu',
    '[\"Doctor\"]',
    'Phạm Thị D',
    '1990-08-30',
    '101 Đường JKL, Quận 7, TP.HCM',
    'https://randomuser.me/api/portraits/women/7.jpg',
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2233445566',
    NULL,
    NULL,
    '987 Clinic Address',
    'Doctor Certificate',
    8,
    '10:00:00',
    '19:00:00',
    'https://randomuser.me/api/portraits/women/8.jpg',
    'https://example.com/certificate4.jpg',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `users` (
    `id`,
    `username`,
    `password`,
    `email`,
    `phone`,
    `gender`,
    `role`,
    `full_name`,
    `date_of_birth`,
    `address`,
    `avatar_url`,
    `is_active`,
    `is_verified`,
    `last_login`,
    `reset_password_token`,
    `reset_password_expires_at`,
    `verification_token`,
    `verification_token_expires_at`,
    `cccd`,
    `cccd_front_image`,
    `cccd_back_image`,
    `clinic_address`,
    `practice_certificate`,
    `experience_years`,
    `opening_time`,
    `closing_time`,
    `doctor_avatar`,
    `certificate_image`,
    `is_doctor_approved`,
    `store_name`,
    `store_address`,
    `business_license`,
    `store_logo`,
    `business_license_url`,
    `store_description`,
    `is_store_verified`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    'hoang_van_e',
    'hashedpassword5',
    'hoangvane@example.com',
    '0945678901',
    'Nam',
    '[\"Doctor\"]',
    'Hoàng Văn E',
    '1975-03-18',
    '202 Đường MNO, Quận 8, TP.HCM',
    'https://randomuser.me/api/portraits/men/9.jpg',
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '3344556677',
    NULL,
    NULL,
    '654 Clinic Address',
    'Doctor Certificate',
    25,
    '08:30:00',
    '17:30:00',
    'https://randomuser.me/api/portraits/men/10.jpg',
    'https://example.com/certificate5.jpg',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `users` (
    `id`,
    `username`,
    `password`,
    `email`,
    `phone`,
    `gender`,
    `role`,
    `full_name`,
    `date_of_birth`,
    `address`,
    `avatar_url`,
    `is_active`,
    `is_verified`,
    `last_login`,
    `reset_password_token`,
    `reset_password_expires_at`,
    `verification_token`,
    `verification_token_expires_at`,
    `cccd`,
    `cccd_front_image`,
    `cccd_back_image`,
    `clinic_address`,
    `practice_certificate`,
    `experience_years`,
    `opening_time`,
    `closing_time`,
    `doctor_avatar`,
    `certificate_image`,
    `is_doctor_approved`,
    `store_name`,
    `store_address`,
    `business_license`,
    `store_logo`,
    `business_license_url`,
    `store_description`,
    `is_store_verified`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    'vu_thi_f',
    'hashedpassword6',
    'vuthif@example.com',
    '0956789012',
    'Nu',
    '[\"Doctor\"]',
    'Vũ Thị F',
    '1983-07-12',
    '303 Đường PQR, Quận 9, TP.HCM',
    'https://randomuser.me/api/portraits/women/11.jpg',
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '4455667788',
    NULL,
    NULL,
    '321 Clinic Address',
    'Doctor Certificate',
    12,
    '07:30:00',
    '16:30:00',
    'https://randomuser.me/api/portraits/women/12.jpg',
    'https://example.com/certificate6.jpg',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `users` (
    `id`,
    `username`,
    `password`,
    `email`,
    `phone`,
    `gender`,
    `role`,
    `full_name`,
    `date_of_birth`,
    `address`,
    `avatar_url`,
    `is_active`,
    `is_verified`,
    `last_login`,
    `reset_password_token`,
    `reset_password_expires_at`,
    `verification_token`,
    `verification_token_expires_at`,
    `cccd`,
    `cccd_front_image`,
    `cccd_back_image`,
    `clinic_address`,
    `practice_certificate`,
    `experience_years`,
    `opening_time`,
    `closing_time`,
    `doctor_avatar`,
    `certificate_image`,
    `is_doctor_approved`,
    `store_name`,
    `store_address`,
    `business_license`,
    `store_logo`,
    `business_license_url`,
    `store_description`,
    `is_store_verified`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    'nguyen_van_g',
    'hashedpassword7',
    'nguyenvang@example.com',
    '0967890123',
    'Nam',
    '[\"Doctor\"]',
    'Nguyễn Văn G',
    '1988-12-25',
    '404 Đường STU, Quận 1, TP.HCM',
    'https://randomuser.me/api/portraits/men/13.jpg',
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '5566778899',
    NULL,
    NULL,
    '159 Clinic Address',
    'Doctor Certificate',
    7,
    '09:00:00',
    '18:00:00',
    'https://randomuser.me/api/portraits/men/14.jpg',
    'https://example.com/certificate7.jpg',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `users` (
    `id`,
    `username`,
    `password`,
    `email`,
    `phone`,
    `gender`,
    `role`,
    `full_name`,
    `date_of_birth`,
    `address`,
    `avatar_url`,
    `is_active`,
    `is_verified`,
    `last_login`,
    `reset_password_token`,
    `reset_password_expires_at`,
    `verification_token`,
    `verification_token_expires_at`,
    `cccd`,
    `cccd_front_image`,
    `cccd_back_image`,
    `clinic_address`,
    `practice_certificate`,
    `experience_years`,
    `opening_time`,
    `closing_time`,
    `doctor_avatar`,
    `certificate_image`,
    `is_doctor_approved`,
    `store_name`,
    `store_address`,
    `business_license`,
    `store_logo`,
    `business_license_url`,
    `store_description`,
    `is_store_verified`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    11,
    'pham_thi_h',
    'hashedpassword8',
    'phamthih@example.com',
    '0978901234',
    'Nu',
    '[\"Doctor\"]',
    'Phạm Thị H',
    '1995-01-14',
    '505 Đường VWX, Quận 4, TP.HCM',
    'https://randomuser.me/api/portraits/women/15.jpg',
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6677889900',
    NULL,
    NULL,
    '852 Clinic Address',
    'Doctor Certificate',
    5,
    '10:00:00',
    '19:00:00',
    'https://randomuser.me/api/portraits/women/16.jpg',
    'https://example.com/certificate8.jpg',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `users` (
    `id`,
    `username`,
    `password`,
    `email`,
    `phone`,
    `gender`,
    `role`,
    `full_name`,
    `date_of_birth`,
    `address`,
    `avatar_url`,
    `is_active`,
    `is_verified`,
    `last_login`,
    `reset_password_token`,
    `reset_password_expires_at`,
    `verification_token`,
    `verification_token_expires_at`,
    `cccd`,
    `cccd_front_image`,
    `cccd_back_image`,
    `clinic_address`,
    `practice_certificate`,
    `experience_years`,
    `opening_time`,
    `closing_time`,
    `doctor_avatar`,
    `certificate_image`,
    `is_doctor_approved`,
    `store_name`,
    `store_address`,
    `business_license`,
    `store_logo`,
    `business_license_url`,
    `store_description`,
    `is_store_verified`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    12,
    'le_van_i',
    'hashedpassword9',
    'levani@example.com',
    '0989012345',
    'Nam',
    '[\"Doctor\"]',
    'Lê Văn I',
    '1972-04-05',
    '606 Đường YZ, Quận 6, TP.HCM',
    'https://randomuser.me/api/portraits/men/17.jpg',
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '7788990011',
    NULL,
    NULL,
    '753 Clinic Address',
    'Doctor Certificate',
    28,
    '08:00:00',
    '17:00:00',
    'https://randomuser.me/api/portraits/men/18.jpg',
    'https://example.com/certificate9.jpg',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );
INSERT INTO
  `users` (
    `id`,
    `username`,
    `password`,
    `email`,
    `phone`,
    `gender`,
    `role`,
    `full_name`,
    `date_of_birth`,
    `address`,
    `avatar_url`,
    `is_active`,
    `is_verified`,
    `last_login`,
    `reset_password_token`,
    `reset_password_expires_at`,
    `verification_token`,
    `verification_token_expires_at`,
    `cccd`,
    `cccd_front_image`,
    `cccd_back_image`,
    `clinic_address`,
    `practice_certificate`,
    `experience_years`,
    `opening_time`,
    `closing_time`,
    `doctor_avatar`,
    `certificate_image`,
    `is_doctor_approved`,
    `store_name`,
    `store_address`,
    `business_license`,
    `store_logo`,
    `business_license_url`,
    `store_description`,
    `is_store_verified`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    13,
    'tran_thi_j',
    'hashedpassword10',
    'tranthij@example.com',
    '0990123456',
    'Nu',
    '[\"Doctor\"]',
    'Trần Thị J',
    '1992-09-09',
    '707 Đường ABC, Quận 2, TP.HCM',
    'https://randomuser.me/api/portraits/women/19.jpg',
    1,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '8899001122',
    NULL,
    NULL,
    '951 Clinic Address',
    'Doctor Certificate',
    6,
    '07:00:00',
    '16:00:00',
    'https://randomuser.me/api/portraits/women/20.jpg',
    'https://example.com/certificate10.jpg',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    '2024-11-20 12:45:22',
    '2024-11-20 12:45:22'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
