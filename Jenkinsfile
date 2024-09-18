pipeline {
    agent { label 'docker' }
    environment{
        DOCKER_CREDENTIALS_ID = 'docker-credentials'
        DOCKER_IMAGE_NAME = 'clariceandrea/shift_sched_image'
    }
    stages {
        stage('Build') {
            steps {
                script {
		            echo '[+] Building....'
                    
                    def dockerImage = docker.build("${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}")
                    
                    echo "[+] Docker Image: ${dockerImage}"

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
            steps {
            withKubeConfig(caCertificate: "${KUBE_CERT}", 
            clusterName: 'kubernetes', 
            contextName: 'kubernetes-admin@kubernetes', 
            credentialsId: 'my-kube-config-credentials', 
            namespace: 'default', 
            restrictKubeConfigAccess: false, 
            serverUrl: 'https://jump-host:6443') {
            echo "[+] Deploying...."
		        sh "sed -i 's#{image}#${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}#g' kubernetes/main_deployment.yml"
                sh 'kubectl apply -f ./kubernetes/.'
                sh 'kubectl config set-context --current --namespace=shift-sched-ns'
                sh 'kubectl get all'
         }
            
        }
    }
  }
}