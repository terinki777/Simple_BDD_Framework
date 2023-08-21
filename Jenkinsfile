pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven_3.9.0"
    }
	
    parameters {
        string(name: 'TAG', defaultValue: '@test', description: 'Tags for tests')
	string(name: 'BRANCH', defaultValue: 'master', description: 'Branch for tests')
    }

    stages {
        stage('Git') {
            steps {
		deleteDir()    
                git url: 'https://github.com/terinki777/Simple_BDD_Framework.git',
                branch: params.BRANCH
            }
        }
	 stage('Test') {
	            steps {
	                bat "mvn -am -pl autotest-rest test -Dtags=${params.TAG} -Ddataproviderthreadcount=5"
	            }
	 }
    }

        
	
	post {
		always {
			 allure([
			includeProperties: false,
      	                jdk: '',
	                reportBuildPolicy: 'ALWAYS',
		        results: [[path: 'autotest-rest/target/allure-results']]
	                ])
		}
	}
}
