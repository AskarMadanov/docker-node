pipeline {
  agent any
  tools {nodejs "nodejs"}
  stages {   
    stage('Git') {
      steps {
        git 'https://github.com/AskarMadanov/docker-node.git'
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