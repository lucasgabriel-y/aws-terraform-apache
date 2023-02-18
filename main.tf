provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "terraform" {
  ami           = "ami-0cc87e5027adcdca8"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.public_security_group.id]


  tags = {
    Name = "Apache terraform"
  }
}







