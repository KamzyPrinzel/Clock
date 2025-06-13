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
                    sh 'docker build -t prinzkay/clock:1 .'  
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

        stage('Push to Docker hub'){
            steps {
                script{
                    with Credentials([string(credentialsId: 'id', variable: 'cred')]){
                    sh 'docker login -u prinzkay -p ${cred}'    
                    }
                    sh 'docker push prinzkay/clock:1'

                }
            }
        }
    }

}
