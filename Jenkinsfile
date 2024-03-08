pipeline {     
    agent any
    environment {
        DOCKER_IMAGE = "lbg"
        VERSION = "1.3"
        PORT = "5001"
        DOCKER_HUB = credentials('docker_credentials')
    }

    stages {
        stage('Prep') {
            steps {
                sh '''
                docker stop $(docker ps -q) || true
                docker rm -f $(docker ps -aq) || true
                docker rmi -f $(docker images) || true
                docker login -u $DOCKER_HUB_USR -p $DOCKER_HUB_PSW
                '''
            }
        }

        stage('Build') {
            steps {
                sh '''
                docker build -t $DOCKER_HUB_USR/$DOCKER_IMAGE:$VERSION --build-arg PORT=$PORT .
                docker push $DOCKER_HUB_USR/$DOCKER_IMAGE:$VERSION
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker run -d -p 5001:$PORT -e PORT=$PORT --name coffee-app $DOCKER_HUB_USR/$DOCKER_IMAGE:$VERSION
                '''
            }
        }
    }
    post {
        always {
            sh "docker logout"
        }
    }
}
