# Terraform Module for Jenkins Installation

This terraform module automates the installation of Jenkins on an AWS EC2 instance using docker and docker-compose. It also creates an elastic IP that can be used to access Jenkins web interface.

## Prerequisites

Before using this module, you will need the following:

- An AWS account with access to create EC2 instances and other resources. You can sign up for a free tier account on the AWS website.
- Terraform installed on your local machine. You can download the appropriate package for your operating system from the Terraform download page and follow the installation instructions or use a package manager such as Homebrew on Mac OS or Chocolatey on Windows.
- AWS CLI configured on your local machine with your AWS credentials and region. You can install the AWS CLI by following the official documentation.

## Usage

To use this module, follow these steps:

- Clone this repository or download the zip file and extract it to your preferred location.
- Navigate to the folder where you have the terraform files and open a terminal or command prompt.
- Run `terraform init` to initialize the terraform project and download the required plugins and modules.
- Run `terraform plan` to see what resources will be created by the module. You can also modify the variables.tf file to customize the values of the input variables, such as AMI ID, instance type, key name, etc.
- Run `terraform apply` to create the resources and execute the user data script. This may take a few minutes to complete.
- Run `terraform output` to see the static IP of the EC2 instance where Jenkins is installed. You can also see a message to wait until Jenkins is ready.
- Once Jenkins is ready, you can access its web interface by typing http://<static_ip>:8080 in your browser. You will need to enter the initial admin password, which you can find in the /var/jenkins_home/secrets/initialAdminPassword file on the EC2 instance. You can use SSH to connect to the instance and view the file content.
- Follow the instructions on the screen to complete the Jenkins setup and start using it.

## Security

By default, this module uses HTTP to communicate with Jenkins, which is not secure and exposes your server to potential attacks. Therefore, you should use HTTPS to encrypt the communication between your browser and your server. There are two ways to achieve this:

- One way is to use an Application Load Balancer (ALB) in front of your EC2 instance and configure it to use HTTPS with a certificate from AWS Certificate Manager (ACM). This way, the ALB will handle the SSL termination and forward the traffic to your instance using HTTP.
- Another way is to install nginx on the same EC2 instance and use it as a reverse proxy to route the traffic to Jenkins. You also need to use certbot to obtain a free certificate from Let's Encrypt and configure nginx to use HTTPS with it. This way, nginx will handle the SSL termination and forward the traffic to Jenkins using HTTP.
