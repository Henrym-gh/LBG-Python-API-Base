pipeline {     
    agent any
    environment {
        DOCKER_IMAGE = "lbg"
        VERSION = "1.3"
        PORT = "5001"
    }
    stages {
        stage('Build') {
            steps {
                sh '''
                sh deploy.sh
                cleanup
                build_docker
                modify_app
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                sh deploy.sh
                run_docker
                '''
            }
        }
    }
}
