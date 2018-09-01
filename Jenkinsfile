#!groovy

node {
	   
	stage('Checkout'){

          checkout scm
       }

       stage('BuildArtifact'){

          sh 'mvn install'
       }
	
	//stage('SonarScannner'){
		//sh 'mvn sonar:sonar'
	//}
	stage('Deploy-To-Tomcat'){
	     
      	//sshagent(['00a60540-6fd0-4533-ae6e-3aee64dc06c0']) {
    	    sh 'cp target/*.war /opt/apache-tomcat-8.0.53/webapps'
        //}
     }
    // stage('Deploy-To-WildFly'){
	     
      	//sshagent(['00a60540-6fd0-4533-ae6e-3aee64dc06c0']) {
    	    sh 'cp **/*.war /opt/wildfly-13.0.0.Final/standalone/deployments'
        //}
    // }
}
