pipeline{
    
agent any

  environment{
    registry = "patilruchita/settlemint1"
    registryCredential = 'patilruchita'
    dockerImage = ''
    
    }
    
    stages{
   	 stage('Checkout'){
   	 	steps{
   	 	  checkout scm           
        }
    }

      }
      }
     
    }
            stage('Building image') {
           steps{
            
           script {
            dockerImage = docker.build registry + ":$BUILD_NUMBER"
            
        }
      }
    }
    
    stage('Push Image To Docker Hub') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
            dockerImage.push('latest')
          }
        }
    
    }
    } 
  }
  }
