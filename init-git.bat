@echo off
echo Initializing Git repository...
git init
git add .
git commit -m "Initial commit for Render deployment"
echo.
echo Repository initialized! 
echo.
echo Next steps:
echo 1. Create a repository on GitHub
echo 2. Add the remote: git remote add origin YOUR_GITHUB_URL
echo 3. Push to GitHub: git push -u origin main
echo 4. Deploy to Render using the GitHub repository
echo.
pause