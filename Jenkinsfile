pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                git branch: 'master', credentialsId:'github-deploy-key', url: 'https://github.com/Git-Buds/Project-Scheduler.git'
                echo "Test"
     }
    }
  }
}
