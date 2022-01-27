pipeline {
    agent any
    triggers {
        githubPullRequests events: [Open()], preStatus: true, spec: '', triggerMode: 'HEAVY_HOOKS',
        no public field ‘acceptMergeRequestOnSuccess’ (or getter method) found in class com.dabsquared.gitlabjenkins.GitLabPushTrigger

    }

    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '60', numToKeepStr: '3')
    }

    }
    parameters {
        credentials credentialType: 'org.jenkinsci.plugins.plaincredentials.impl.FileCredentialsImpl', defaultValue: 'Secretfile', name: 'SECRET_FILE', required: false
        gitParameter branchFilter: 'origin/(.*)', defaultValue: 'master', name: 'BRANCH', type: 'PT_BRANCH'
    }

    stages {
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