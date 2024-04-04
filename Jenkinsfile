pipeline {
    agent any
    
    environment {
        DOCKER_HUB_USERNAME = 'subhikshasuresh1701'
        DOCKER_HUB_PASSWORD = 'Love170801'
        DOCKER_IMAGE_NAME = 'pro-collab-app'
        GIT_USERNAME = 'subhisuresh17'
        GIT_PASSWORD = 'Love170801*'
        GIT_REPO_URL = 'https://github.com/subhisuresh17/Pro-Collab-Application-latest.git'
        GIT_CREDENTIALS_ID = 'github-token'
    }
    
    stages {
        stage('Clone Git Repository') {
            steps {
                // Clone the Git repository using credentialsId
                git credentialsId: GIT_CREDENTIALS_ID, url: GIT_REPO_URL, branch: 'main'
            }
        }
      
        stage('docker-compose down') {
            steps {
                // Run docker-compose down to stop any existing containers
                sh 'sudo docker-compose down'
            }
        }
        stage('docker-compose up') {
            steps {
                // Run docker-compose up to create and start containers
                sh 'sudo docker-compose up -d'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                // Log in to Docker Hub and push the image
                sh "sudo docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD"
                sh "sudo docker tag $DOCKER_IMAGE_NAME $DOCKER_HUB_USERNAME/$DOCKER_IMAGE_NAME"
                sh "sudo docker push $DOCKER_HUB_USERNAME/$DOCKER_IMAGE_NAME"
            }
        }
    }
}
