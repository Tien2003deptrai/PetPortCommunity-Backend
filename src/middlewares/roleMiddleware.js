exports.authorizeRole = roles => (req, res, next) => {
  const userRoles = req.user.role; // userRoles là một mảng
  console.log('User roles:', userRoles);

  // Kiểm tra nếu ít nhất một vai trò của người dùng nằm trong danh sách roles
  if (userRoles.some(role => roles.includes(role))) {
    return next();
  }

  return res.status(403).json({ error: 'Forbidden' });
};
