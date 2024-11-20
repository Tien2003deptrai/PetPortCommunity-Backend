const bcrypt = require('bcrypt');

const comparePasswords = async (inputPassword, hashedPassword) => {
  return await bcrypt.compare(inputPassword, hashedPassword);
};

module.exports = { comparePasswords };
