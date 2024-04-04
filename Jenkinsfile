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
                git credentialsId: GIT_CREDENTIALS_ID, url: GIT_REPO_URL, branch: 'main'
            }
        }
        stage('Build Project') {
            steps {
                // Change directory to the cloned repository and build the project with Maven
                dir('Pro-Collab-Application-latest') {
                    // Build the project with Maven
                    sh 'mvn clean package'
                }
            }
        }

        stage('docker-compose down - old') {
            steps {
                // Change directory to where docker-compose file is located
                dir('Pro-Collab-Application-latest') {
                    // Run docker-compose down
                    sh 'sudo docker-compose down '
                }
            }
        }
        stage('docker-compose container') {
            steps {
                // Change directory to where docker-compose file is located
                dir('Pro-Collab-Application-latest') {
                    // Run docker-compose up
                    sh 'sudo docker-compose up -d '
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
