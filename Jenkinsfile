node {  
	    def mvnHome = tool 'maven'
	    
	    stage('Code Checkout') {
	      checkout([$class: 'GitSCM',
                    branches: [[name: 'main']],
                    userRemoteConfigs: [[url: 'https://github.com/princeabhijeet/discovery-service.git']],
                    credentialsId: 'git_credentials'])
	    }    
	  
	    stage('Build JAR') {
	      sh "'${mvnHome}/bin/mvn' clean install -DskipTests=true"
	    }
			
	    stage('Build Image') {
	      dockerImage = docker.build("discovery-service:latest")
	    }
	   
}