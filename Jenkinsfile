pipeline {
  agent any
  tools {nodejs "NodeJS" }
  stages {   
    stage('Git') {
      steps {
        git branch: 'main', url: 'https://github.com/AskarMadanov/docker-node.git'
      }
    }
     
    stage('Build') {
      steps {
        sh 'npm install'
      }
    }       
    stage('Test') {
      steps {
        sh 'npm test'
      }
    }
  }
}