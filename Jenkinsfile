pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                git branch: 'master', credentialsId:'github-deploy-key', url: 'git@github.com:Git-Buds/Project-Scheduler.git'
                echo "Test"
     }
    }
  }
}