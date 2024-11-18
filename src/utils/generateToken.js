const jwt = require('jsonwebtoken');

exports.generateToken = (userId, role) => {
  const token = jwt.sign({ userId, role }, process.env.JWT_SECRET, { expiresIn: '7d' });
  return { token };
};

exports.generateRefreshTokenAndSetCookie = (res, userId) => {
  const token = jwt.sign({ userId }, process.env.JWT_SECRET, {
    expiresIn: '7d',
  });

  if (res && typeof res.cookie === 'function') {
    res.cookie('refreshToken', token, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'strict',
      maxAge: 7 * 24 * 60 * 60 * 1000, // 7 ngày
    });
  } else {
    throw new Error('Invalid response object passed to generateRefreshTokenAndSetCookie');
  }

  return token;
};
