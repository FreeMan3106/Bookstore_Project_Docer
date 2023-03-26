#! /bin/bash
hostnamectl set-hostname docker_instance
yum update -y
yum install docker -y
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user
# install docker-compose
curl -SL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

yum install python3 -y
pip3 install flask
pip3 install flask_mysql
yum install git -y
mkdir /home/ec2-user/bookstory && cd /home/ec2-user/bookstory
TOKEN="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"
cd /home/ec2-user && git clone https://$TOKEN@github.com/FreeMan3106/Terraform-Phonebook-Application-deployed-on-AWS.git
python3 /home/ec2-user/Terraform-Phonebook-Application-deployed-on-AWS/phonebook-app.py