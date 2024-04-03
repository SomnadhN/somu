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
        stage('Checkout Git Repository') {
            steps {
                // Check out the Git repository using credentialsId
                git credentialsId: GIT_CREDENTIALS_ID, url: GIT_REPO_URL, branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build Docker image using Dockerfile
                sh 'docker build -t $DOCKER_IMAGE_NAME .'
            }
        }
        stage('Run Container') {
            steps {
                // Run the container and map ports
                sh 'docker run -p 1111:1111 -d $DOCKER_IMAGE_NAME'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                // Log in to Docker Hub and push the image
                sh "docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD"
                sh "docker tag $DOCKER_IMAGE_NAME $DOCKER_HUB_USERNAME/$DOCKER_IMAGE_NAME"
                sh "docker push $DOCKER_HUB_USERNAME/$DOCKER_IMAGE_NAME"
            }
        }
    }
}
