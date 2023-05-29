pipeline {
    agent any 
    tools{
        jdk 'jdk11'
        maven 'maven3'
    }

    environment {
        NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "3.110.49.37:8081"
        NEXUS_REPOSITORY = "maven-nexus-repo"
        NEXUS_CREDENTIAL_ID = "Nexus-cred"
        DOCKERHUB_USERNAME = "USERNAME"
        APP_NAME = "spring-petclinic"
        IMAGE_NAME = "${DOCKERHUB_USERNAME}" + "/" + "${APP_NAME}"
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout SCM'){
            when { expression { true } }
            steps {
                container('git'){
                    git url: 'https://github.com/naresh9919/spring-petclinic.git'
                    branch: 'main'
                }
            }
            post{
                success {
                    sendStatus("Git Checkout","success")
                }
            }
        }
        stage('Build SW'){
            when { expression { true } }
            steps {
                container('maven'){
                    sh 'mvn -Dmaven.test.failure.ignore=true clean package'
                }
            }
            post {
                success{
                    junit '**/target/surefire-reports/*.xml'
                    sendStatus("SW Build","success")
                }
            }
        }
    }
}
