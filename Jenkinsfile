pipeline {
    agent any
    
    environment {
        myuser = credentials ('dockerhub-user')
        mypassword = credentials ('dockerhub-password')

        POSTGRES_HOST = credentials ('POSTGRES_HOST')
        POSTGRES_PASSWORD = credentials ('POSTGRES_PASSWORD')
        AWS_ACCESS_KEY_ID = credentials ('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
        version = "v3"
        keyfile = credentials ('keyfile')

    }
    
    stages {
       stage ("download code") {
         steps {
            sh '''
            git clone https://github.com/github-kits26kat24/hr-app.git
           
            '''
         }
       }
    
       stage ("build image") {
         steps {
            sh '''
                  cd hr-app
                  docker build -t kitskat/hr-app:v3 .
               '''   
         }
       }
    
       stage ("publish image") {
         steps {
            sh '''
                  docker login -u $myuser -p $mypassword
                  docker push kitskat/hr-app:v3
                '''
         }
       }       
    
       stage ("Build image") {
         steps {
            sh '''
               ls
                # docker run --name kitskat-1  --rm -d -p 80:5000 kitskat/hr-app:v3
               '''
         }
       }
           
    
       stage ("Run ansible") {
         steps {
            sh '''
                 cd hr-app
                 cd Ansible
                 pwd 
                 ls
                 ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i inventory --key-file $keyfile playbook.yml -u ec2-user
                 ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i inventory  --key-file $keyfile playbookA.yml -u ec2-user 
               '''
         }
       }

    }

    post {
        always {
            deleteDir()
        }
    }
}