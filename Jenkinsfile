pipeline {     
    agent any
    environment {
        DOCKER_IMAGE = "lbg"
        VERSION = "1.3"
        PORT = "5001"
    }

    stages {
        stage('Prep') {
            steps {
                sh '''
                chmod +x deploy.sh
                ./deploy.sh
                cleanup
                '''
            }
        }

        stage('Build') {
            steps {
                sh '''
                ./deploy.sh
                build_docker
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                ./deploy.sh
                run_docker
                '''
            }
        }
    }
}
