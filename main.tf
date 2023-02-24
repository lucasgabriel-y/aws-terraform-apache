provider "aws" {
  region = "us-east-2"
}

#Cria o recurso para usar uma chave de acesso  
resource "aws_key_pair" "key-pair" {
  key_name   = "apache-key"
  public_key = file("/apache-key.pub")

}

#Cria a instancia EC2
resource "aws_instance" "terraform" {
  ami                         = "ami-0cc87e5027adcdca8"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.public_security_group.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.key-pair.key_name #Associa a chave de acesso a instancia


  tags = {
    Name = "Apache terraform"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("/apache-key")
    }

    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo yum install git -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "git clone https://bitbucket.org/dptrealtime/html-web-app.git",
      "cd html-web-app",
      "sudo cp * -r /var/www/html"
    ]
  }

}

#Associa um IP elastico a uma instancia
resource "aws_eip" "eip" {
  instance = aws_instance.terraform.id
}

output "IP" {
  value = aws_eip.eip.public_ip

}









