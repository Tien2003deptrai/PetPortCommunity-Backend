const { authenticateJWT } = require('./authMiddleware');
const { authorizeRole } = require('./roleMiddleware');
const { validate } = require('./validate');

module.exports = {
  authenticateJWT,
  authorizeRole,
  validate,
};
