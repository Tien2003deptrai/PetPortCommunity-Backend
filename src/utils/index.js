const { corsOptions } = require('./corsOptions');
const { generateToken, generateRefreshTokenAndSetCookie } = require('./generateToken');
const passport = require('./passport');
const { limiter } = require('./rateLimiter');
const { responseHandler } = require('./responseHandler');

module.exports = {
  corsOptions,
  limiter,
  passport,
  generateToken,
  generateRefreshTokenAndSetCookie,
  responseHandler,
};
