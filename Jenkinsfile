pipeline {
    agent any

       environment {
        DOCKERHUB_CREDENTIALS = credentials('delta')
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
               
                    sh 'docker build . -f dockerB.dockerfile -t build-chat'
                
            }
        }
        
        stage('Tests') {
            steps {
                echo 'Testing...'
               
                    sh 'docker build . -f dockerT.dockerfile -t test-chat'
                
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
                    sh 'docker build . -f dockerP.dockerfile -t publish-chat'
                sh "docker run --volume /var/jenkins_home/workspace/deltachat_pipe/Lab05:/toTar publish-chat mv deltaDesktop.tar.xz /toTar"
                  dir('/var/jenkins_home/workspace/deltachat_pipe/Lab05'){
			        archiveArtifacts artifacts: "deltaDesktop.tar.xz"
			    }
            }
        }
    }
}