pipeline {
    
    agent any

    tools {
        maven 'maven'
    }
    
    options {
        skipDefaultCheckout(true)
    }

    stages {
        stage('Git Checkout') {
            steps {
                echo 'Stage : Git Checkout : START'
                checkout([$class: 'GitSCM',
                    branches: [[name: 'main']],
                    userRemoteConfigs: [[url: 'https://github.com/princeabhijeet/discovery-service.git']],
                    credentialsId: 'git_credentials'])
                echo 'Stage : Git Checkout : COMPLETE'
            }
        }

        stage('Build JAR') {
            steps {
                echo 'Stage : Build JAR : START'
                sh "mvn clean install -DskipTests=true"
                echo 'Stage : Build JAR : COMPLETE'
            }
        }

        stage('Build Image') {
            steps {
                echo 'Stage : Build Image : START'
                sh "docker build -t discovery-service:latest ."
                echo 'Stage : Build Image : COMPLETE'
            }
        }

        stage('DockerHub Push') {
            steps {
                echo 'Stage : DockerHub Push : START'
                withCredentials([usernamePassword(credentialsId: 'dockerhub_credentials', 
                    usernameVariable: 'princeabhijeet', 
                    passwordVariable: 'Prince@10')]) {
                    sh "docker login -u princeabhijeet -p Prince@10"
                    sh "docker tag discovery-service princeabhijeet/discovery-service:latest"
                    sh "docker push princeabhijeet/discovery-service:latest"
                }
                echo 'Stage : DockerHub Push : COMPLETE'
            }
        }
    }
}