pipeline {
    agent any

    stages {

        stage('Clear Working Directory') {
            steps {
                deleteDir()
            }
        }

        stage('Check out of GitHub repo') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/KamzyPrinzel/Clock.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t clock:1 .'
                    sh 'docker run -d -p 5555:5555 clock:1'  
                }
            }
        }

        stage('Scan Docker Image with Trivy') {
            steps {
                script {
                    sh 'trivy image clock:1 > clock-1-result.txt'
                }
            }
        }
    }

}
