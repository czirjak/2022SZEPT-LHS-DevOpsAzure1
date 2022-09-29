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
    }
}
