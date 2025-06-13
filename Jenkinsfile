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
                }
            }
        }
    }
}
