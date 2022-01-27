pipeline {
    agent any
    options { timestamps () //Добавление параметров вереми для каждой строки
              buildDiscarder(logRotator(daysToKeepStr: '90', numToKeepStr: '3'))
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
}