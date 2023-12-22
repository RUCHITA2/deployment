pipeline {
    agent any

    environment {
        // Define environment variables if needed
        DOCKER_HUB_REPO = 'patilruchita/settlemint1'
    }

  stages{
   	 stage('Checkout'){
   	 	steps{
   	 	  checkout main           
        }
    }


    stages {
        stage('Build') {
            steps {
                echo 'Building the project'
                // Add your build steps here
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests'
                // Add your test steps here
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image'
                // Add your Docker build steps here
                docker.withRegistry(https://registry.hub.docker.com, 'Dockerhub') {
                        dockerImage = docker.build(patilruchita/settlemint1)
                    }

            }
        }

        stage('Push Image To Docker Hub') {
            steps {
                echo 'Pushing Docker image to Docker Hub'
                // Add your Docker push steps here
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'Dockerhub') {
                        docker.image(patilruchita/settlemint1).push()
                    }
                }
            }
        }
    }
}
