
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
docker/
│   ├── docker-compose.yml   # Services: Jenkins, Prometheus, Grafana
│   ├── prometheus.yml 
Jenkinsfile
README.md

---

## 🛠 Technologies Used

- Jenkins (CI/CD)
- Node.js (NestJS Backend)
- React (Frontend)
- PM2 (Backend process management)
- Bash (for deployment automation)
- Git & GitHub
- Docker & Docker Compose (for containerizing services)
- Prometheus (for metrics collection and system monitoring)
- grafana (for real-time dashboards and alerting)


---

## 🔁 Deployment Workflow

1. Jenkins pulls code from GitHub
2. Builds and tests backend and frontend
3. Packages both apps into `.tar.gz` files
4. Deploys backend using `deploy/deploy_backend.sh`
5. If deployment fails, `rollback.sh` restores the backup
6. Monitoring Stack:
       Prometheus scrapes metrics from Jenkins and system exporters
       Grafana displays interactive dashboards with build/deploy statistics

---
📌 How to Run Jenkins Job

  Make sure the following requirements are met before running the Jenkins pipeline:
 Jenkins has sufficient permissions to read/write to deployment and backup directories.
 The Jenkins user has PM2 installed and accessible globally for managing backend processes.
 Node.js and npm are installed on the system to allow building and testing of both backend and frontend applications.
 Docker and Docker Compose are properly installed and running for container-based services.
 Monitoring stack with Prometheus and Grafana is set up and running to track pipeline metrics and performance.
 
---
       docker-compose up -d

## ✅ Author

Created by Haram Fatima  
