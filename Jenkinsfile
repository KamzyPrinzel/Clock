pipeline{
    angent any

    stages{
        stage ('Clear Working Directory'){
            step{
                script{
                    deleteDir()
                }
            }
        }
            
        stage ('Check out of github repo'){
            step{
                check smcGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/KamzyPrinzel/Clock.git']]) 
            }
        }  

        stage ('Build Docker Image'){
            step{
                script{
                    sh 'docker build -t clock:1 .'
                }
            }
        }    
    }
}