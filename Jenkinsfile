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

            stage('Pushing Docker Image to Dockerhub') {
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
            stage('deploing ingresses') {
                steps{
                  sh "kubectl apply -f ./k8s --namespace docker-node"
                }
            }
            stage('Update container name'){
                steps{
                    sh "kubectl set image --namespace=docker-node deployment/docker-node-1 docker-node-container=$registry:$BUILD_NUMBER"
                }
            }
        }
    }

