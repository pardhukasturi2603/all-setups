curl -fL -o jenkins.rpm \
https://mirrors.in2.sahilister.net/jenkins/rpm-stable/jenkins-2.580.2-1.noarch.rpm
rpm -Kv jenkins.rpm
sudo rpm -ivh jenkins.rpm
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
