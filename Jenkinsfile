node {
    def app

    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image */

        app = docker.build("peacengell/guestbook")
    }

    stage('Test image') {
        
        app.inside {
            echo "Test Pass"
        }
    }

    stage('Push image') {
        /* 
			You would need to first register with DockerHub before you can push images to your account
		*/
        docker.withRegistry('https://registry.hub.docker.com', 'docker_hub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            } 
                echo "Trying to Push Docker Build to DockerHub"
    }

    stage('Deploying to kubernetes') {
        sh('kubectl apply -f guestbook/all-in-one/guestbook-all-in-one.yaml -n deployment')
        sh('kubectl get po -n deployment')
    }
}
