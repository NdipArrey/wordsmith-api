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

        stage('Code Review') {
            environment {
                scannerHome = tool "SonarScanner"
            }
            steps {
                withSonarQubeEnv('Sonarqube') {
                    sh "${scannerHome}/bin/sonar-scanner" 
                } 
            }
        } 

        stage('Deployment') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {  
                    sh 'docker login -u $USERNAME -p $PASSWORD'
                    sh 'docker build -t wordsmith-api:v1 .'
                    sh 'docker tag wordsmith-api:v1 ndiparrey/wordsmith-api:v1'
                    sh 'docker push ndiparrey/wordsmith-api:v1'
                }
            }
        }
    }
}
           
