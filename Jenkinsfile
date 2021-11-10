pipeline {
    environment {
    registry = "askarmadanov/node-app"
    registryCredential = 'docker-credentials'
    dockerImage = ''
    }

    agent any
    stages {
            stage('Cloning our Git') {
                steps {
                  git branch :'main',url :'https://github.com/AskarMadanov/docker-node.git'
                }
            }

            stage('Building Docker Image') {
                steps {
                    script {
                        dockerImage = docker.build registry + ":$BUILD_NUMBER"
                    }
                }
            }

            stage('Deploying Docker Image to Dockerhub') {
                steps {
                    script {
                        docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                        }
                    }
                }
            }

            stage('Cleaning Up') {
                steps{
                  sh "docker rmi --force $registry:$BUILD_NUMBER"
                }
            }
        }
    }