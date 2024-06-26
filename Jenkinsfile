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

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonarqube') {
                sh "mvn sonar:sonar"
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
           
