pipeline {
    agent any
    
    triggers {
         pollSCM '* * * * *'
    }
    environment {
        CI = false          // do not treat warnings as errors
    }
    stages {
        stage('Install Dependencies and build') {
            steps {
                // Use Node.js and npm installed on the Jenkins agent
                sh 'npm install'
                sh 'npm run build'
                
            }
        } 
        stage('dockerising') {
            steps {
                
             withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                 sh 'docker login -u $USERNAME -p $PASSWORD'
    // Your Docker commands using the environment variables
                 sh 'docker build -t qrmomojenk:${BUILD_NUMBER} .'
                sh 'docker tag qrmomojenk:${BUILD_NUMBER} dkfolefac/qrmomojenk:${BUILD_NUMBER}'
                sh 'docker push dkfolefac/qrmomojenk:${BUILD_NUMBER}'
             }
            } 

        }         
    
       
    }    
}
    
