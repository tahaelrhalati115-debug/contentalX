# Deploy to Render - Step by Step Guide

## Prerequisites
1. Create a free account at [Render.com](https://render.com)
2. Install Git on your system (optional but recommended)

## Deployment Steps

### Option 1: Deploy via GitHub (Recommended)

1. **Create a GitHub Repository**
   - Go to GitHub.com and create a new repository
   - Name it something like `apikey-auth-demo`
   - Don't initialize with README (we'll push our existing code)

2. **Push Code to GitHub**
   ```bash
   # In your project directory
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/apikey-auth-demo.git
   git push -u origin main
   ```

3. **Deploy on Render**
   - Go to your Render Dashboard
   - Click "New +" → "Web Service"
   - Connect your GitHub account
   - Select your `apikey-auth-demo` repository
   - Configure settings:
     - Name: `apikey-auth-demo`
     - Environment: `Node`
     - Build Command: `npm install`
     - Start Command: `npm start`
     - Instance Type: Free (or choose paid tier for production)

4. **Environment Variables** (Add in Render Dashboard)
   ```
   NODE_ENV=production
   ```

### Option 2: Deploy Directly via Render Dashboard

1. **Go to Render Dashboard**
   - Visit https://dashboard.render.com
   - Click "New +" → "Web Service"

2. **Configure Your Service**
   - **Name**: `apikey-auth-demo`
   - **Environment**: Select `Node`
   - **Region**: Choose closest to your users
   - **Branch**: `main`
   - **Root Directory**: Leave empty (root of repo)
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`

3. **Advanced Settings**
   - Add Environment Variable:
     - Key: `NODE_ENV`
     - Value: `production`

4. **Deploy**
   - Click "Create Web Service"
   - Wait for deployment to complete (usually 2-5 minutes)

## Important Notes for Production

### Security Considerations
1. **Change Default Credentials**
   - The app creates default `admin/admin` user
   - Log in and change the password immediately
   - Or modify the code to use environment variables for credentials

2. **Session Configuration**
   - Current session secret is hardcoded (`dev-secret-change-me`)
   - For production, use a strong random secret
   - Consider using Redis for session storage

3. **Database Persistence**
   - SQLite database will be lost on Render restarts
   - For production, use PostgreSQL or another persistent database
   - Render offers free PostgreSQL instances

### Database Migration (Optional but Recommended)
To use PostgreSQL instead of SQLite:

1. Add PostgreSQL addon in Render dashboard
2. Update `db.js` to use PostgreSQL client
3. Add `pg` dependency to `package.json`

## Access Your Application

Once deployed, Render will provide you with a URL like:
`https://apikey-auth-demo-xxxx.onrender.com`

You can access:
- Login page: `https://your-app-url.onrender.com/login.html`
- Admin panel: `https://your-app-url.onrender.com/admin.html`
- API endpoints: `https://your-app-url.onrender.com/api/...`

## Troubleshooting

1. **Check Logs**: View deployment logs in Render dashboard
2. **Environment Variables**: Ensure all required vars are set
3. **Build Issues**: Check if all dependencies are in `package.json`
4. **Runtime Errors**: Check application logs for specific errors

## Custom Domain (Optional)

1. In Render dashboard, go to your service
2. Click "Settings" tab
3. Scroll to "Custom Domains"
4. Add your domain and follow DNS instructions

The application will be accessible at your custom domain!