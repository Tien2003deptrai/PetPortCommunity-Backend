const schedule = require('node-schedule');
const backupDatabase = require('./mysqldumpBackup');

schedule.scheduleJob('0 2 * * *', () => {
  console.log('Bắt đầu backup database theo lịch...');
  backupDatabase();
});
