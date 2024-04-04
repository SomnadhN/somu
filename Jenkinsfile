pipeline {
    agent any
    
    environment {
        DOCKER_HUB_USERNAME = 'subhikshasuresh1701'
        DOCKER_HUB_PASSWORD = 'Love170801'
        DOCKER_IMAGE_NAME = 'pro-collab-application'
        GIT_USERNAME = 'subhisuresh17'
        GIT_PASSWORD = 'Love170801*'
        GIT_REPO_URL = 'https://github.com/subhisuresh17/Pro-Collab-Application-latest.git'
        GIT_CREDENTIALS_ID = 'github-token'
        PROJECT_DIR = 'Pro-Collab-Application-latest' // Specify the project directory
    }
    
    
    stages {
        stage('Clone Git Repository') {
            steps {
                git credentialsId: GIT_CREDENTIALS_ID, url: GIT_REPO_URL, branch: 'main'
            }
        }
        stage('Build Project') {
            steps {
                // Change directory to the project directory and build with Maven
                dir(PROJECT_DIR) {
                    sh 'mvn clean package'
                }
            }
        }

        stage('docker-compose down - old') {
            steps {
                dir(PROJECT_DIR) {
                    sh 'sudo docker-compose down'
                }
            }
        }
        stage('docker-compose container') {
            steps {
                dir(PROJECT_DIR) {
                    sh 'sudo docker-compose up -d'
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                sh "sudo docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD"
                sh "sudo docker tag $DOCKER_IMAGE_NAME $DOCKER_HUB_USERNAME/$DOCKER_IMAGE_NAME"
                sh "sudo docker push $DOCKER_HUB_USERNAME/$DOCKER_IMAGE_NAME"
            }
        }
    }
}
