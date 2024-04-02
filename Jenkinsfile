pipeline {
    agent any
    
    triggers {
         pollSCM '* * * * *'
    }
    stages {
        stage ('sonarqube analysis'){
            environment {
                scannerHome = tool "sonarscanner"
            }
            steps{
                withSonarQubeEnv('sonarscanner')
            }

        }
    }    
}
    