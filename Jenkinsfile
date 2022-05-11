pipeline {
    agent any

       environment {
        DOCKERHUB_CREDENTIALS = credentials('delta')
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                dir('ITE/GCL08/SZ400605/Lab05') {
                    sh 'docker build . -f dockerB.dockerfile -t build-chat'
                }
            }
        }
        
        stage('Tests') {
            steps {
                echo 'Testing...'
                dir('ITE/GCL08/SZ400605/Lab05') {
                    sh 'docker build . -f dockerT.dockerfile -t test-chat'
                }
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh '''
                docker tag build-chat:latest luxikhs/devops-deploy
                docker push luxikhs/devops-deploy
                '''
            }
        }
        
        stage('Publish') {
            steps {
                echo 'Publishing...'
                dir('ITE/GCL08/SZ400605/Lab05') {
                    sh 'docker build . -f dockP.dockerfile -t publish-chat'
                }
                sh "docker run --volume /var/jenkins_home/workspace/deltachat_pipe/ITE/GCL08/SZ400605/Lab05:/finalArchive publish-chat mv archive.tar.xz /finalArchive"
            }
        }
    }
}