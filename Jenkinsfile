pipeline {
    agent any

    triggers {
        pollSCM '* * * * *'
    }

    tools {
        maven 'Mavem' 
    }
    stages {
        
        stage('Build') {
            
            steps {
                sh 'mvn clean package'
            }
        }
    }    
}
