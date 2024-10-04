pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = credentials('dockerhub-credentials')
        DOCKER_IMAGE_NAME = 'yourdockerhubusername/my-express-app'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/expressjs/express.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t $DOCKER_IMAGE_NAME .'
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    withDockerRegistry(credentialsId: 'dockerhub-credentials', url: 'https://index.docker.io/v1/') {
                        sh 'docker push $DOCKER_IMAGE_NAME'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Assuming you're using a cloud service for deployment
                    sh 'kubectl apply -f k8s/deployment.yaml'
                    sh 'kubectl apply -f k8s/service.yaml'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
