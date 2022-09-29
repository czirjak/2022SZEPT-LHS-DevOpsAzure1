pipeline
{
    agent any

    stages
    {
        stage('Compile')
        {
            steps
            {
                sh "./gradlew clean compileTest"
            }
        }
        stage('Test')
        {
            steps
            {
                sh "./gradlew test -x compileTest"
            }
        }
        stage('Build')
        {
            steps
            {
                sh "./gradlew build -x test"
            }
        }
        stage('Build docker image')
        {
            steps 
            {
                sh "docker build --tag lecsobkw/simplejavaapp ."
            }
        }
        stage('Running integration tests')
        {
            steps
            {
                echo 'Running integration tests on container'
            }
        }
        stage('Tag git branch')
        {
            steps
            {
                sh "chmod 777 ./tag.sh"
                sh "ls -l"
                sh "./tag.sh 5.0"
            }
        }
    }
}
