const mysqldump = require('mysqldump');
const path = require('path');
const fs = require('fs');

async function backupDatabase() {
  const backupFolder = path.join(__dirname, '../backups'); // Folder lưu trữ backup
  const backupFile = `${backupFolder}/backup-${new Date().toISOString().split('T')[0]}.sql`;

  try {
    // Kiểm tra và tạo thư mục backups nếu chưa tồn tại
    if (!fs.existsSync(backupFolder)) {
      fs.mkdirSync(backupFolder, { recursive: true });
      console.log(`Created backup folder at: ${backupFolder}`);
    }

    console.log('Starting database backup...');

    // Tiến hành backup database với cấu hình tùy chỉnh
    await mysqldump({
      connection: {
        host: 'localhost', // Địa chỉ server MySQL
        user: 'root', // Tên user MySQL
        password: 'Tien2003@', // Mật khẩu MySQL
        database: 'a_new1', // Tên database
      },
      dumpToFile: backupFile, // Đường dẫn file dump
      dump: {
        skipComments: true, // Loại bỏ các dòng comment
        addDropTable: true, // Thêm câu lệnh DROP TABLE trước mỗi CREATE TABLE
        disableForeignKeyChecks: true, // Vô hiệu hóa kiểm tra khóa ngoại
      },
    });

    console.log(`Backup completed successfully! File saved at: ${backupFile}`);
  } catch (error) {
    console.error('Failed to backup database:', error.message);

    // Ghi nhật ký lỗi vào file log
    const errorLogPath = path.join(__dirname, '../backups/backup-error.log');
    fs.appendFileSync(errorLogPath, `${new Date().toISOString()} - Error: ${error.message}\n`);
    console.error(`Error logged to: ${errorLogPath}`);
  }
}

// Thực thi backup
backupDatabase();

module.exports = backupDatabase;
