const {
  VERIFICATION_EMAIL_TEMPLATE,
  PASSWORD_RESET_REQUEST_TEMPLATE,
  PASSWORD_RESET_SUCCESS_TEMPLATE,
} = require('./emailTemplate');
const { transporter } = require('../config/mail');

async function sendVerificationEmail(email, verificationToken) {
  transporter.sendMail(
    {
      to: email,
      subject: 'Verify your email',
      html: VERIFICATION_EMAIL_TEMPLATE.replace('{verificationCode}', verificationToken),
    },
    function (error, info) {
      if (error) {
        console.error('Error sending verification email', error);
        throw new Error('Error sending verification email: ' + error.message);
      } else {
        console.log('Verification email sent successfully', info);
      }
    }
  );
}

// Function to send a welcome email
async function sendWelcomeEmail(email, name) {
  transporter.sendMail(
    {
      to: email,
      subject: 'Welcome to Auth Company',
      html: `
        <!DOCTYPE html>
        <html lang="en">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>Welcome Email</title>
          <style>
            body {
              font-family: Arial, sans-serif;
              line-height: 1.6;
              color: #333;
              max-width: 600px;
              margin: 0 auto;
              padding: 20px;
              background-color: #f9f9f9;
            }
            .header {
              background: linear-gradient(to right, #2196F3, #1E88E5);
              padding: 20px;
              text-align: center;
              color: white;
              border-radius: 5px 5px 0 0;
            }
            .content {
              background-color: white;
              padding: 20px;
              border-radius: 0 0 5px 5px;
              box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
              text-align: center;
            }
            .footer {
              text-align: center;
              margin-top: 20px;
              color: #888;
              font-size: 0.8em;
            }
          </style>
        </head>
        <body>
          <div class="header">
            <h1>Welcome, ${name}!</h1>
          </div>
          <div class="content">
            <p>Thank you for verifying your email.</p>
            <p>We are excited to have you join us at Auth Company.</p>
          </div>
          <div class="footer">
            <p>This is an automated message, please do not reply to this email.</p>
          </div>
        </body>
        </html>
      `,
    },
    function (error, info) {
      if (error) {
        console.error('Error sending welcome email', error);
        throw new Error('Error sending welcome email: ' + error.message);
      } else {
        console.log('Welcome email sent successfully', info);
      }
    }
  );
}

// Function to send a password reset email
async function sendPasswordResetEmail(email, resetURL) {
  transporter.sendMail(
    {
      to: email,
      subject: 'Reset your password',
      html: PASSWORD_RESET_REQUEST_TEMPLATE.replace('{resetURL}', resetURL),
    },
    function (error, info) {
      if (error) {
        console.error('Error sending password reset email', error);
        throw new Error('Error sending password reset email: ' + error.message);
      } else {
        console.log('Password reset email sent successfully', info);
      }
    }
  );
}

// Function to send a password reset success email
async function sendResetSuccessEmail(email) {
  transporter.sendMail(
    {
      to: email,
      subject: 'Password Reset Successful',
      html: PASSWORD_RESET_SUCCESS_TEMPLATE,
    },
    function (error, info) {
      if (error) {
        console.error('Error sending password reset success email', error);
        throw new Error('Error sending password reset success email: ' + error.message);
      } else {
        console.log('Password reset success email sent successfully', info);
      }
    }
  );
}

module.exports = {
  sendVerificationEmail,
  sendWelcomeEmail,
  sendPasswordResetEmail,
  sendResetSuccessEmail,
};
