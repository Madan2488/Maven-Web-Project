#!groovy

node {
	   
	stage('Checkout'){

          checkout scm
       }

       stage('BuildArtifact'){

          sh 'mvn install'
       }
	stage('Deploy-To-Tomcat'){
	     
      	sshagent(['00a60540-6fd0-4533-ae6e-3aee64dc06c0']) {
    	    sh 'scp -o StrictHostKeyChecking=no target/*.war ec2-user@172.31.14.4:/opt/apache-tomcat-8.0.53/webapps'
        }
     }
     stage('Deploy-To-WildFly'){
	     
      	sshagent(['00a60540-6fd0-4533-ae6e-3aee64dc06c0']) {
    	    sh 'scp -o StrictHostKeyChecking=no **/*.war ec2-user@172.31.14.4:/opt/wildfly-13.0.0.Final/standalone/deployments'
        }
     }
}
