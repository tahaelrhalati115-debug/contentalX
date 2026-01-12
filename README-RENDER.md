# API Key Auth Demo - Render Deployment

This is a Node.js application that provides API key authentication with an admin interface.

## Quick Deploy to Render

1. **Sign up at [Render.com](https://render.com)** (free account available)
2. **Create a new Web Service**
3. **Configuration:**
   - **Name**: `apikey-auth-demo`
   - **Environment**: Node
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Environment Variables**: 
     ```
     NODE_ENV=production
     ```

## Features

- 🔐 Username/password login system
- 🗝️ API key generation and management
- 📊 Admin dashboard for key management
- ✅ Key validation endpoint for external applications
- 🛡️ Hardware ID binding support
- ⏰ Expiration and usage limits

## Default Access

- **URL**: Provided by Render after deployment
- **Login**: `admin` / `admin` (⚠️ Change immediately in production!)
- **Endpoints**:
  - Login: `/login.html`
  - Admin: `/admin.html`
  - API Validation: `POST /api/validate-key`

## Security Notes

⚠️ **Important for Production:**
- Change the default admin password
- Update the session secret in `index.js`
- Consider migrating to PostgreSQL for persistent data
- Use environment variables for sensitive configuration

## File Structure

```
apikey-auth-demo/
├── index.js          # Main server file
├── db.js            # Database operations (SQLite)
├── public/          # Frontend files
│   ├── login.html
│   ├── admin.html
│   └── app.js
├── package.json     # Dependencies
└── render.yaml      # Render deployment config
```

## Support

For deployment issues, check the Render dashboard logs or refer to the full deployment guide in `DEPLOYMENT-GUIDE.md`.