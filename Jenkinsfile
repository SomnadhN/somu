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
        stage('Build Docker Image') {
            steps {
                // Copy the generated JAR file to the Docker build context
                sh 'cp Pro-Collab-Application-latest/target/ProCollab-0.0.1-SNAPSHOT.jar .'

                // Build Docker image using Dockerfile
                sh 'sudo docker build -t $DOCKER_IMAGE_NAME .'
            }
        }
        stage('docker-compose container') {
            steps {
                // Run the container and map ports
                sh 'sudo docker-compose up -d '
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
