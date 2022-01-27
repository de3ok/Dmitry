pipeline {
    agent any
    triggers {
        githubPullRequests events: [Open()], preStatus: true, spec: '', triggerMode: 'HEAVY_HOOKS'
    }

    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '60', numToKeepStr: '3')
    }


    parameters {
        credentials credentialType: 'org.jenkinsci.plugins.plaincredentials.impl.FileCredentialsImpl', defaultValue: 'Secretfile', name: 'SECRET_FILE', required: false
        gitParameter branchFilter: 'origin/(.*)', defaultValue: 'master', name: 'BRANCH', type: 'PT_BRANCH'
    }

    
    node {
        stage('checkout') {
            checkout scm
        }
        stage('deploy') {
            echo 'branch name ' + env.BRANCH_NAME

            if (env.BRANCH_NAME.startsWith("Feature_")) {
            echo "Deploying to Dev environment after build"
            } else if (env.BRANCH_NAME.startsWith("Release_")) {
            echo "Deploying to Stage after build and Dev Deployment"
            } else if (env.BRANCH_NAME.startsWith("master")) {
            echo "Deploying to PROD environment"
            }

            sh '''
            "chmod +x HelloWorld.sh 
            . / HelloWorld.sh ""
            '''

        }
    }

    stages {

        stage('checkout'){
            steps{
                script{
                    checkout
                }
            }
        }
        stage('print_env_1') { //Вывод всех переменных среды
            steps {
                echo "Hello World! and Sasha! =)"
            }
        }
    }
    post {
        always {
            chuckNorris()
            script {
            step([$class: 'WsCleanup'])
       }
    }
  }
}