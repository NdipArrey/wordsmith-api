pipeline {
    agent any

    triggers {
        pollSCM '* * * * *'
    }

    tools {
        maven 'Maven' 
    }
    stages {
        
        stage('Build') {
            
            steps {
                sh 'mvn clean package'
            }
        }
    } 

    environment {
        CI = false //do not treat errors as warnings
        SONARSCANNER = "SonarScanner"
    }

    stages {

        stage('Code Review') {
            environment {
                scannerHome = tool "SonarScanner";
            }
            steps {
                withSonarQubeEnv('Sonarqube') 
                sh "${scannerHome}/bin/sonar-scanner"         
               
            }
        } 
    }
}
