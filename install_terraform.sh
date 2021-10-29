#! /bin/bash

# Install Terraform
# verification of the OS

if [ -f /etc/os-release ];then
   osname=`grep ID /etc/os-release | egrep -v 'VERSION|LIKE|VARIANT' | cut -d'=' -f2 | sed -e 's/"//' -e 's/"//'`
   echo $osname
else
   echo "can not locate /etc/os-release - unable find the osname"
   exit 8

if [ $osname == "ubuntu" ];then

    clear
    echo "proceed with terraform installation"
    sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt-get update && sudo apt-get install terraform

    echo "`terraform --version | head -1 ` installed successfully"

elif [ $osname == "amzn" ]; then

    clear
    echo " proceeding with terraform installation"
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
    sudo yum -y install terraform

    echo "`terraform --version | head -1 ` installed successfully"

elif [ $1 == "centos" ];then

    clear
    echo " proceeding with terraform installation"
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    sudo yum -y install terraform

    echo "`terraform --version | head -1 ` installed successfully"

fi

exit 0

