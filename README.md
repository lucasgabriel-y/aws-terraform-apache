# aws-terraform-apache
Projeto para subir um webserver Apache numa instância AWS EC2 com Terraform

Etapas de execução:
  Infraestrutura:
    Cria uma VPC /16 com duas subnets;
    Cria um grupo de segurança permitindo acesso a partir da porta 22 de um endereço específco e acesso público a porta 80 e 443;
    Cria uma instância EC2 do tipo t2.micro usando a Amazon Linux2 AMI;
    Cria um par de chaves para acesso SSH;
    Cria um IP elástico e associa o IP à instância do EC2;
    Executa o acesso SSH para instalaçãod de recursos na instancia; 
    
  Recursos na instancia:
    Instala um servidor Web Apache;
    Instala o Git;
    Configura o Apache para iniciar automaticamente após a reinicialização da instância;
    Realiza um git clone do código-fonte de um repositório no Bit Bucket;
    Adiciona o código-fonte na pasta raiz do servidor da web na /var/www/html.

