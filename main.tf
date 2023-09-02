provider "aws" {
  region = "eu-central-1"
  default_tags {
    tags = {
      Terraform   = "true"
      Environment = "${var.infra_env}"
    }
  }
}

resource "aws_instance" "jenkins" {
  ami           = var.ami # Ubuntu
  instance_type = var.instace_type
  key_name      = var.keyname
  root_block_device {
    volume_size = 25
  }

  vpc_security_group_ids = ["${aws_security_group.jenkins_sg.id}", "${var.alb_sg}"]
  subnet_id              = var.public_subnets[0]

  tags = {
    Name = "${var.instance_name}"
  }

  user_data = file("userdata.sh")
}

resource "aws_eip" "jenkins_elasticIP" {
  vpc = true

  instance = aws_instance.jenkins.id
  tags = {
    Name = "${var.instance_name}-ElasticIP"
  }
}

output "jenkins_static_ip" {
  value = aws_eip.jenkins_elasticIP.public_ip
}


output "msg" {
  value = "Please wait 3-10 mintues until ${var.instance_name} is up and running."
  depends_on = [
    aws_instance.jenkins
  ]
}
