const { validationResult } = require('express-validator');

exports.validate = validations => {
  return async (req, res, next) => {
    // console.log('req', req);
    await Promise.all(validations.map(validation => validation.run(req)));

    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      console.error('Validation Errors:', errors.array()); // Log lỗi validation
      return res.status(400).json({ errors: errors.array() });
    }
    next();
  };
};
