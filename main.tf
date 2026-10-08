provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "docker_ec2" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  key_name      = "my-keypair"

  tags = {
    Name = "DockerEC2"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras enable docker
              yum install -y docker
              service docker start
              usermod -aG docker ec2-user
              EOF
}

