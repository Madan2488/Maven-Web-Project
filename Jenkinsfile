#!groovy

node {
	   
	stage('Checkout'){

          checkout scm
       }

       stage('BuildArtifact'){

          bat 'mvn install'
       }
	   
      stage('Sonar') {
                    //add stage sonar
                    bat 'mvn sonar:sonar'
                }
       
}
