# Fullstack CI/CD Pipeline Project 🚀

This project demonstrates a complete CI/CD pipeline for a fullstack application using **NestJS (Backend)** and **React (Frontend)**. It automates the entire lifecycle — build, test, package, and deploy — using **Jenkins**, with rollback support and production-ready setup on a local Ubuntu server.

---

## 🔧 Tech Stack

- **Frontend**: React.js
- **Backend**: NestJS
- **CI/CD Tool**: Jenkins
- **Process Manager**: PM2
- **Package Manager**: npm
- **Scripting**: Bash

---

## 📂 Project Structure

/frontend # React frontend source
/backend # NestJS backend source
/deploy
└── deploy_backend.sh # Deployment script for backend
└── rollback.sh # Rollback script for backend
/Jenkinsfile # CI/CD pipeline definition


---

## 🚀 CI/CD Pipeline Overview

1. **Checkout** project from GitHub
2. **Install** dependencies for both frontend & backend
3. **Build** both apps
4. **Package** built apps into `.tar.gz`
5. **Deploy** backend using `deploy_backend.sh`
6. **Rollback** if deployment fails (from backup)

---

## 🧪 Tests

Currently prints "No tests yet" for placeholder — you can extend `npm test` sections in `package.json`.

---

## 🔙 Rollback Support

If deployment fails, Jenkins automatically triggers `rollback.sh` to restore the last successful backup.

---

## ✅ How to Run Locally

Clone this repo and run Jenkins locally. Make sure Jenkins has permission to:

```bash
sudo chown -R jenkins:jenkins /var/lib/jenkins
