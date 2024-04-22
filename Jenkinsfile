// Import the necessary classes
import org.jenkinsci.plugins.docker.workflow.*

// Use the method in a script block approved by the whitelist
script {
    docker.image("react-docker").stop()
}


pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository
                git branch: 'main', url: 'https://github.com/thananchayan/4227_Thananchayan.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image
                script {
                    docker.build("react-docker:tag")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run Docker container
                script {
                    docker.image("react-docker:tag").run("-d -p 8083:8083 --name react-docker")
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                // Verify deployment
                sh 'curl http://localhost:8083' // Example: Use curl to check if the application is running
            }
        }
    }

    post {
        always {
            // Cleanup
            script {
                docker.image("react-docker:tag").stop()
                docker.image("react-docker:tag").remove(force: true)
            }
        }
    }
}