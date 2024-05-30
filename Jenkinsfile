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
}
