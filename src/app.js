const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const cookieParser = require('cookie-parser');
const chalk = require('chalk');
const helmet = require('helmet');
const { limiter, corsOptions, passport } = require('./utils');
const setupSwaggerDocs = require('./swagger');
require('module-alias/register');

// require('./utils/scheduleBackup');

require('dotenv').config();

// Middleware

const app = express();

// Essential middleware
app.use(express.json());
app.use(helmet());
app.use(express.urlencoded({ extended: true }));
app.use(cors(corsOptions));
app.use(cookieParser());
app.use(limiter);
app.use(passport.initialize());
// app.use(noCacheMiddleware); // Apply to all routes

// Logging with morgan and chalk
app.use(
  morgan((tokens, req, res) => {
    return [
      chalk.yellow(tokens.method(req, res)),
      chalk.cyan(tokens.url(req, res)),
      chalk.green(tokens.status(req, res)),
      chalk.magenta(tokens['response-time'](req, res) + ' ms'),
      chalk.blue(tokens['remote-addr'](req, res)),
    ].join(' ');
  })
);

// app.use('/api/v1', require('./routes/index'));
app.use('/api/v1', require('./routes/index'));

setupSwaggerDocs(app);

// API routes
app.get('/index', (req, res) => {
  res.status(200).json({
    message: 'Welcome to the pet management system!',
  });
});

// Global error handler
app.use((err, req, res, next) => {
  res.status(err.status || 500).json({
    success: false,
    status: err.status || 500,
    message: err.message,
  });
});

module.exports = app;
