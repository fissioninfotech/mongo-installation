pipeline {
  agent any
    
  tools {nodejs "nodejs"}
    
  stages {
        
    stage('Cloning Git') {
      steps {
        // git branch: 'dev', credentialsId: '8f86369d-6c3f-4118-b2f4-09c2a069cb4e', url: 'git@github.com:fissioninfotech/nuke-web-api.git'
        // git branch: 'main', credentialsId: '8f86369d-6c3f-4118-b2f4-09c2a069cb4e', url: 'git@github.com:fissioninfotech/mongo-installation.git'
        echo"GitHub Webhook Success"
      }
    }
        
    // stage('Install dependencies') {
    //   steps {
    //     sh '/var/www/html/nuke/testing/test-api-urlchange.sh'
    //     sh 'npm install'
    //   }
    // }
    // stage('Deploy') {
    //   steps {
    //     sh 'scp -r ${WORKSPACE}/bin root@139.59.40.195:/var/www/html/NUKE/api/'
    //     sh 'scp -r ${WORKSPACE}/process root@139.59.40.195:/var/www/html/NUKE/api/'
    //     sh 'scp -r ${WORKSPACE}/public/stylesheets root@139.59.40.195:/var/www/html/NUKE/api/'
    //     sh 'scp -r ${WORKSPACE}/routes root@139.59.40.195:/var/www/html/NUKE/api/'
    //     sh 'scp -r ${WORKSPACE}/ssl root@139.59.40.195:/var/www/html/NUKE/api/'
    //     sh 'scp -r ${WORKSPACE}/uploads root@139.59.40.195:/var/www/html/NUKE/api/'
    //     sh 'scp -r ${WORKSPACE}/app.js root@139.59.40.195:/var/www/html/NUKE/api/'
    //     sh 'scp -r ${WORKSPACE}/config.js root@139.59.40.195:/var/www/html/NUKE/api/'
    //     sh 'scp -r ${WORKSPACE}/emailContent.js root@139.59.40.195:/var/www/html/NUKE/api/'
    //     sh 'scp -r ${WORKSPACE}/headerFunctions.js root@139.59.40.195:/var/www/html/NUKE/api/'
    //     sh 'scp -r ${WORKSPACE}/io.js root@139.59.40.195:/var/www/html/NUKE/api/'
    //     sh 'scp -r ${WORKSPACE}/ipc.js root@139.59.40.195:/var/www/html/NUKE/api/'
    //     sh 'scp -r ${WORKSPACE}/mongo.js root@139.59.40.195:/var/www/html/NUKE/api/'
    //     sh 'scp -r ${WORKSPACE}/package-lock.json root@139.59.40.195:/var/www/html/NUKE/api/'
    //     sh 'scp -r ${WORKSPACE}/package.json root@139.59.40.195:/var/www/html/NUKE/api/'
    //     sh 'scp -r ${WORKSPACE}/test.js root@139.59.40.195:/var/www/html/NUKE/api/'

    //   }
    // }
    // stage('PM2 Restart') {
    //   steps {
    //     sh 'ssh root@139.59.40.195 "pm2 restart 0"'  
    //   }
    // }
    stage('CleanWorkspace') {
        steps {
                cleanWs()
            }
        }
    }
    post {
        always {
            echo 'Email Notification'
            // emailext body: '$DEFAULT_CONTENT',
            emailext mimeType: 'text/html',
            body: '${script,path="/var/www/html/jenkins-email-templates/temp.html"}',
            recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
            replyTo: '$DEFAULT_REPLYTO',
            subject: '$DEFAULT_SUBJECT',
            to: '$DEFAULT_RECIPIENTS'
       
      }
    }      
  }
