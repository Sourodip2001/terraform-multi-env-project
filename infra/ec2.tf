resource "aws_key_pair" "mykeypair" {
  key_name   = "${var.env}-key"
  public_key = file("public-key") 

  tags = {
    Name        = "${var.env}-key"
    Environment = var.env
  }
}


resource "aws_default_vpc" "default" {}

resource "aws_security_group" "my_security_group" {
  name        = "${var.env}-infra-app"
  description = "Environment-based security group"
  vpc_id      = aws_default_vpc.default.id

  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_ip]
  }

  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic (safe default)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.env}-sg"
    Environment = var.env
  }
}

resource "aws_instance" "myec2instance" {
  count           = var.instance_count
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.my_security_group.name]
  key_name        = aws_key_pair.mykeypair.key_name

  root_block_device {
    volume_size = var.ec2_default_size
    volume_type = "gp3"
  }

  tags = {
    Name        = "${var.env}-ec2"
    Environment = var.env
  }
}
