pipeline {
    agent any
    triggers {
        githubPullRequests events: [Open()], preStatus: true, spec: '', triggerMode: 'HEAVY_HOOKS',
    }

    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '60', numToKeepStr: '3')
    }

    }
    parameters {
        credentials credentialType: 'org.jenkinsci.plugins.plaincredentials.impl.FileCredentialsImpl', defaultValue: 'Secretfile', name: 'SECRET_FILE', required: false
        gitParameter branchFilter: 'origin/(.*)', defaultValue: 'master', name: 'BRANCH', type: 'PT_BRANCH'
    }

    checkout(
    [
        $class: 'GitSCM',
        extensions: [
            [
                $class: "PreBuildMerge",
                options: [
                    mergeTarget: "master",
                    fastForwardMode: "FF",
                    mergeRemote: "origin",
                    mergeStrategy: "RECURSIVE_THEIRS"
                ],
            ],
            [
                $class: 'UserIdentity',
                email: 'user@company.com',
                name: 'user123'
            ],
        ],
    ]
    )

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