#bring up the application
sudo yum install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 416591745024.dkr.ecr.eu-west-2.amazonaws.com
docker run -d —name  today-personal -p 80:80 416591745024.dkr.ecr.eu-west-2.amazonaws.com/personal-app-demo/personal-app:latest
# docker run -d -p 8080:8080 --name jenkins-container  416591745024.dkr.ecr.eu-west-2.amazonaws.com/personal-jenkins-repo/jenkins-app

