pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven_3.9.3"
    }
	
    parameters {
        string(name: 'TAG', defaultValue: '@test', description: 'Tags for tests')
    }

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git url: 'https://github.com/terinki777/Simple_BDD_Framework.git',
                branch: params.BRANCH
                // Run Maven on a Unix agent.
                sh "mvn -am -pl autotest-rest test -Dtags=${params.TAG} -Ddataproviderthreadcount=5"
            }
        }
    }
	post {
		always {
			 allure([
	           reportBuildPolicy: 'ALWAYS',
		       results: [[path: 'autotest-rest/target/allure-results']]
	       ])
		}
	}
}
