provider "aws" {
  region = "us-east-1"
}

# Create Security Group
resource "aws_security_group" "ec2_sg" {
  name        = "bharati-ec2-sg"
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # later we will restrict to your IP
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create EC2 Instance
resource "aws_instance" "demo" {

  ami           = "ami-0c02fb55956c7d316"  # Amazon Linux 2 (us-east-1)
  instance_type = "t2.micro"
  key_name = "Day29"
  security_groups = [aws_security_group.ec2_sg.name]

  tags = {
    Name = "bharati-demo-server"
  }
}

# Output public IP
output "ec2_public_ip" {
  value = aws_instance.demo.public_ip
}
