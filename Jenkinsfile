pipeline {
    agent {
        label "docker"
    }
    environment {
        DOCKER_CREDENTIALS_ID = 'docker-credentials'
        DOCKER_IMAGE_NAME = 'shift_sched_image'
        
    }
    
    
    stages {
        stage('Build and Push Docker Image') {
            steps {
               
                script {
                    def dockerCredentials = credentials(DOCKER_CREDENTIALS_ID)
                    echo "Username is: ${dockerCredentials.username}"
                    // Build the Docker image
                    def dockerImage = docker.build("${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}")
                    
                    // Push the Docker image
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_CREDENTIALS_ID) {
                        dockerImage.push("${BUILD_NUMBER}")
                        dockerImage.tag('latest')
                        dockerImage.push('latest')
                    }
                }
            }
        }
        stage('Deploy') {
          steps{
              script{
                echo "[+]Deploy"
              }
          }
        }
    }
}
