
provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_security_group" "jenkins_lab" {
  name        = "${var.project_name}-jenkins-sg"
  description = "Restricted SSH and Jenkins UI access for a portfolio lab"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH from administrator CIDR only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  ingress {
    description = "Jenkins UI from administrator CIDR only"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = var.project_name
  }
}

resource "aws_instance" "jenkins" {
  ami                        = var.ami_id
  instance_type              = var.instance_type
  subnet_id                  = data.aws_subnets.default.ids[0]
  vpc_security_group_ids     = [aws_security_group.jenkins_lab.id]
  key_name                   = var.key_pair_name
  associate_public_ip_address = true

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    encrypted   = true
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name    = "${var.project_name}-jenkins"
    Project = var.project_name
  }
}
