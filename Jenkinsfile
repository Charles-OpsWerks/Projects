pipeline {
    agent { label 'docker' }
    environment{
        DOCKER_CREDENTIALS_ID = 'docker-credentials'
        DOCKER_IMAGE_NAME = 'shift_sched_image'
    }
    stages {
        stage('Build') {
            steps {
                script {
		                echo '[+] Building....'
		                
		                git branch: 'master', url: 'https://github.com/Git-Buds/Project-Scheduler.git'
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
            steps {
            withKubeConfig(caCertificate: "${KUBE_CERT}", 
            clusterName: 'kubernetes', 
            contextName: 'kubernetes-admin@kubernetes', 
            credentialsId: 'my-kube-config-credentials', 
            namespace: 'default', 
            restrictKubeConfigAccess: false, 
            serverUrl: 'https://jump-host:6443') 
            
            echo "[+] Deploying...."
                sh 'kubectl apply -f ./kubernetes/.'
                sh 'kubectl get all'
        }
    }
}
}