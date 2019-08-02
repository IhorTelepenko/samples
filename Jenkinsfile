pipeline {
    agent any

    stages {
        stage('Deploy') {
            when {
              expression {
                currentBuild.result == null || currentBuild.result == 'SUCCESS'
              }
            }
            steps {
                sh 'sudo docker service rm nginx && sudo docker service create \
--name nginx \
--replicas 3 \
--mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
nginx:stable-alpine'
            }
        }
    }
}
