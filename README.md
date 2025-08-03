
# CI/CD Pipeline with Jenkins for Web App (React + NestJS)

This project sets up a professional CI/CD pipeline using Jenkins to automate the build, test, package, and deployment processes of a web application. It uses React for the frontend and NestJS for the backend, and includes production-grade features like backups, rollback, and shell-based deployment scripts.

---

## 🚀 Features

- Jenkins Pipeline for CI/CD
- Auto build/test for both frontend and backend
- Backend: NestJS (Node.js), Frontend: React
- Tar-based artifact packaging
- Shell scripts for backend deployment and rollback
- Backup of previous backend deployments
- PM2 for Node.js process management
- GitHub integration

---

## 📁 Project Structure

/backend
/frontend
/deploy
└── deploy_backend.sh
└── rollback.sh
Jenkinsfile
README.md

yaml
Copy
Edit

---

## 🛠 Technologies Used

- Jenkins (CI/CD)
- Node.js (NestJS Backend)
- React (Frontend)
- PM2 (Backend process management)
- Bash (for deployment automation)
- Git & GitHub

---

## 🔁 Deployment Workflow

1. Jenkins pulls code from GitHub
2. Builds and tests backend and frontend
3. Packages both apps into `.tar.gz` files
4. Deploys backend using `deploy/deploy_backend.sh`
5. If deployment fails, `rollback.sh` restores the backup

---

## 📌 How to Run Jenkins Job

Make sure:
- Jenkins has permission to access `/home/malikraheel/deployment/`
- Jenkins user has PM2 installed and running
- Node/NPM are installed for both build environments

Run the Jenkins job from UI or using a webhook push trigger.

---

## ✅ Author

Created by Haram Fatima  
