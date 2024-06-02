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
                withSonarQubeEnv('ServerNameSonar') {
                    bat '''mvn clean verify sonar:sonar -Dsonar.projectKey=ProjectNameSonar -Dsonar.projectName='ProjectNameSonar' -Dsonar.host.url=http://localhost:9000''' //port 9000 is default for sonar
                    echo 'SonarQube Analysis Completed'
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
           
