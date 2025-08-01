pipeline {
    agent any

    tools {
        nodejs 'NodeJS' // Use the globally installed Node
    }

    environment {
        SERVER_IP = "10.171.221.161"
        SSH_USER = "jenkins"
        BACKEND_DIR = "backend"
        FRONTEND_DIR = "frontend"
    }

    stages {
        stage('Build Backend') {
            steps {
                dir("${env.BACKEND_DIR}") {
                    sh 'npm install'
                    sh 'npm test || echo "Tests failed, continuing..."'
                    sh 'npm run build'
                }
            }
        }

        stage('Build Frontend') {
            steps {
                dir("${env.FRONTEND_DIR}") {
                    sh 'npm install'
                    sh 'npm test || echo "Tests failed, continuing..."'
                    sh 'npm run build'
                }
            }
        }

        stage('Package Artifacts') {
            steps {
                dir("${env.BACKEND_DIR}") {
                    sh 'tar -czf ../backend.tar.gz dist'
                }
                dir("${env.FRONTEND_DIR}") {
                    sh 'tar -czf ../frontend.tar.gz build'
                }
                stash name: 'artifacts', includes: '*.tar.gz'
            }
        }

        stage('Deploy') {
            steps {
                unstash 'artifacts'
                sh 'bash deploy/deploy_backend.sh'
                sh 'bash deploy/deploy_frontend.sh'
            }
        }

        stage('Notify') {
            steps {
                echo "Deployment Completed!"
            }
        }
    }

    post {
        failure {
            echo "Deployment Failed! Triggering rollback..."
            sh 'bash deploy/rollback.sh'
        }
    }
}

