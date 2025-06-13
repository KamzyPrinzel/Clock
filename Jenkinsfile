pipeline {
    agent any

    environment {
        IMAGE_NAME = 'prinzkay/clock:1'
    }

    stages {

        stage('Clear Working Directory') {
            steps {
                deleteDir()
            }
        }

        stage('Check out GitHub Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/KamzyPrinzel/Clock.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Scan Docker Image with Trivy') {
            steps {
                sh 'trivy image $IMAGE_NAME > clock-1-result.txt'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-password', variable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u prinzkay --password-stdin
                        docker push $IMAGE_NAME
                    '''
                }
            }
        }
    }
}
