pipeline
{
    agent any

    environment
    {
        DOCKER_SECRET = credentials("licsak-docker")
        VERSION="${ sh (script:'git rev-parse --short HEAD')}"
    }
    
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
            when
            {
                branch "main"
            }
            steps
            {
                sshagent(credentials: ['jenkins-user'])
                {
                    sh '''
                        chmod 777 ./tag.sh
                        ./tag.sh $VERSION
                    '''
                }
            }
        }
        stage('Push docker image')
        {
            when
            {
                branch "main"
            }
            steps
            {
                sh "docker login -u $DOCKER_SECRET_USR -p $DOCKER_SECRET_PSW"
                sh "docker tag lecsobkw/simplejavaapp lecsobkw/simplejavaapp:$VERSION"
                sh "docker push lecsobkw/simplejavaapp:$VERSION"
            }
        }
    }
}
