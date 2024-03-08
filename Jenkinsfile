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
                docker stop $(docker ps -q) || true
                docker rm -f $(docker ps -aq) || true
                docker rmi -f $(docker images) || true
                '''
            }
        }

        stage('Build') {
            steps {
                sh '''
                docker build -t $DOCKER_IMAGE:$VERSION .
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker run -d -p 5001:$PORT -e PORT=$PORT --name coffee-app $DOCKER_IMAGE:$VERSION
                '''
            }
        }
    }
}
