pipeline {
    agent any
    
    environment {
        DOCKER_HUB_USERNAME = 'subhikshasuresh1701'
        DOCKER_HUB_PASSWORD = 'Love170801*'
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
                dir('Pro-Collab-Application-latest') {
                    git credentialsId: GIT_CREDENTIALS_ID, url: GIT_REPO_URL, branch: 'main'
                }
            }
        }
        stage('Build Project') {
            steps {
                // Change directory to the cloned repository and build the project with Maven
                dir('Pro-Collab-Application-latest') {
                    sh 'mvn clean package'
                }
            }
        }
      
        stage('Start Docker Containers') {
            steps {
                // Change directory to the location of docker-compose.yml and run docker-compose up -d
                dir('Pro-Collab-Application-latest') {
                    sh 'sudo docker-compose up -d'
                }
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
