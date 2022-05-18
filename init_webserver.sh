#!/bin/bash

# Create mount volume for logs
  sudo su - root
  mkfs.ext4 /dev/sdf
  mount -t ext4 /dev/sdf /var/log
# install awscli
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
# Install & Start nginx server
  yum search nginx 
  amazon-linux-extras install nginx1 -y
  systemctl start nginx
  systemctl enable nginx
  sudo mkdir -p /usr/share/nginx/html/app1/
  

# Install code deploy agent
  sudo yum update -y
  sudo yum install ruby wget -y
  cd /home/ec2-user
  wget https://aws-codedeploy-us-west-1.s3.us-west-1.amazonaws.com/latest/install
  chmod +x ./install
  sudo ./install auto







