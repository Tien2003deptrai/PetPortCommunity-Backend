const userService = require('~/service/UserService');
const { generateToken, generateRefreshTokenAndSetCookie } = require('~/utils/generateToken');

const UserController = {
  async register(req, res, next) {
    try {
      const newUser = await userService.registerUser(req.body);
      generateRefreshTokenAndSetCookie(res, newUser.id);
      res.status(201).json({ success: true, data: newUser });
    } catch (error) {
      next(error);
    }
  },

  async verifyEmail(req, res, next) {
    try {
      const user = await userService.verifyEmail(req.body.code);
      res.status(200).json({ success: true, message: 'Email verified successfully', data: user });
    } catch (error) {
      next(error);
    }
  },

  async login(req, res, next) {
    try {
      const user = await userService.login(req.body.email, req.body.password);
      const { token, expiresAt } = generateToken(user.id, user.role);
      generateRefreshTokenAndSetCookie(res, user.id);
      res.status(200).json({ success: true, token, expiresAt, user });
    } catch (error) {
      next(error);
    }
  },

  async forgotPassword(req, res, next) {
    try {
      await userService.forgotPassword(req.body.email);
      res.status(200).json({ success: true, message: 'Password reset link sent' });
    } catch (error) {
      next(error);
    }
  },

  async resetPassword(req, res, next) {
    try {
      await userService.resetPassword(req.params.token, req.body.password);
      res.status(200).json({ success: true, message: 'Password reset successfully' });
    } catch (error) {
      next(error);
    }
  },

  async getUserById(req, res, next) {
    try {
      const user = await userService.getUserById(req.params.id);
      res.status(200).json({ success: true, data: user });
    } catch (error) {
      next(error);
    }
  },

  async getDoctors(req, res, next) {
    try {
      const doctors = await userService.getDoctors();
      res.status(200).json({ success: true, data: doctors });
    } catch (error) {
      next(error);
    }
  },

  async updateUserInfo(req, res, next) {
    try {
      const updatedUser = await userService.updateUserInfo(req.params.id, req.body);
      res.status(200).json({ success: true, data: updatedUser });
    } catch (error) {
      next(error);
    }
  },

  async refreshToken(req, res, next) {
    try {
      const refreshToken = req.cookies.refreshToken;
      const { newAccessToken, expiresAt } = await userService.refreshAccessToken(refreshToken);
      res.status(200).json({ token: newAccessToken, expiresAt });
    } catch (error) {
      console.error('Error refreshing token:', error.message);
      res.status(403).json({ error: error.message });
    }
  },

  async logout(req, res, next) {
    try {
      res.clearCookie('refreshToken');
      res.status(200).json({
        success: true,
        message: 'Logged out successfully',
      });
    } catch (error) {
      next(error);
    }
  },
};

module.exports = UserController;
