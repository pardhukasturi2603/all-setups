sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo yum install java-21-amazon-corretto -y
curl -fL -o jenkins.rpm \
https://mirrors.in2.sahilister.net/jenkins/rpm-stable/jenkins-2.580.2-1.noarch.rpm
rpm -Kv jenkins.rpm
sudo rpm -ivh jenkins.rpm
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
curl -fL -o emsign-root-tls-g1.crt https://repository.emsign.com/certs/roottlscag1.crt
openssl x509 -in emsign-root-tls-g1.crt -noout -fingerprint -sha256
CE:F7:1E:70:B7:C2:9A:DD:F6:C3:0C:D1:9E:61:4B:38:FD:5F:02:A4:35:A0:EE:DD:D0:08:7E:18:3D:10:1A:51
cp emsign-root-tls-g1.crt /etc/pki/ca-trust/source/anchors/
update-ca-trust extract
openssl verify -CAfile /etc/pki/tls/certs/ca-bundle.crt emsign-root-tls-g1.crt
curl -Iv https://ftp-nyc.osuosl.org/pub/jenkins/plugins/
systemctl restart jenkins
