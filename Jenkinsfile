#!groovy

node {
	   
	stage('Checkout'){

          checkout scm
       }

       stage('BuildArtifact'){

          sh 'mvn install'
       }
	stage('DockerImage')
	{
		sh 'sudo docker build -t madan2488/dockertomcat:2.0 .'
	}
	stage('pushdockerimage'){
		withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
    // some block
			sh "sudo docker login -u madan2488 -p ${dockerHubpwd}"
		}
		sh 'sudo docker push madan2488/dockertomcat:2.0'
	}
	stage('RuncontaineronDevServer'){
	      
		def dockerRun = 'sudo docker run -p 8080:8080 -d --name my-app madan2488/dockertomcat:2.0'
		sshagent(['00a60540-6fd0-4533-ae6e-3aee64dc06c0']) {
			sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.14.4 ${dockerRun}"
		}
	      }
	
	//stage('SonarScannner'){
		//sh 'mvn sonar:sonar'
	//}
	//stage('Deploy-To-Tomcat'){
	     
      	//sshagent(['00a60540-6fd0-4533-ae6e-3aee64dc06c0']) {
    	  //  sh 'cp target/*.war /opt/apache-tomcat-8.0.53/webapps'
        //}
     //}
    //stage('Deploy-To-WildFly'){
	     
      	//sshagent(['00a60540-6fd0-4533-ae6e-3aee64dc06c0']) {
    	//    sh 'cp **/*.war /opt/wildfly-13.0.0.Final/standalone/deployments'
        //}
    //}
}
