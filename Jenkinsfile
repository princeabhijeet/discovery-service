node {

    def MAVEN_HOME = tool name: 'maven'
    def MAVEN_CMD = "${MAVEN_HOME}/bin/mvn "
    
    def DOCKER_HOME = tool name: 'docker'
    def DOCKER_CMD = "${DOCKER_HOME}/bin/docker "
    
    stage('Git Checkout') {
    	echo 'Stage : Git Checkout : START'   	
    	checkout([$class: 'GitSCM',
        	branches: [[name: 'main']],
        	userRemoteConfigs: [[url: 'https://github.com/princeabhijeet/discovery-service.git']],
        	credentialsId: 'git_credentials'])
        echo 'Stage : Git Checkout : COMPLETE'
    }

    stage('Build JAR') {
    	echo 'Stage : Build JAR : START'
        script {
            sh "${MAVEN_CMD} clean install -DskipTests=true"
        }
        echo 'Stage : Build JAR : COMPLETE'
    }
    
    stage('Build Image') {
    	echo 'Stage : Build Image : START'
        script {
            sh "${DOCKER_CMD} build -t discovery-service -f Dockerfile ."
        }
        echo 'Stage : Build Image : COMPLETE'
    }

    stage('DockerHub Push') {
    	echo 'Stage : DockerHub Push : START'
        script {
            withCredentials([usernamePassword(credentialsId: 'dockerhub_credentials', 
            usernameVariable: 'princeabhijeet', 
            passwordVariable: 'Prince@10')]) {
                sh "${DOCKER_CMD} login -u princeabhijeet -p Prince@10"
                sh "${DOCKER_CMD} tag discovery-service princeabhijeet/discovery-service:latest"
                sh "${DOCKER_CMD} push princeabhijeet/discovery-service:latest"
            }
        }
        echo 'Stage : DockerHub Push : COMPLETE'
    }
}

