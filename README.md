# aws-terraform-apache
Projeto para subir um webserver Apache numa instância AWS EC2 com Terraform


![Diagrama](https://devopsrealtime.com/wp-content/uploads/2022/05/Webapp.png)

## Etapas de execução:
###  Infraestrutura:
    1. Cria uma VPC /16 com duas subnets;
    2. Cria um grupo de segurança permitindo acesso a partir da porta 22 de um endereço específco e acesso público a porta 80 e 443;
    3. Cria uma instância EC2 do tipo t2.micro usando a Amazon Linux2 AMI;
    4. Cria um par de chaves para acesso SSH;
    5. Cria um IP elástico e associa o IP à instância do EC2;
    6. Executa o acesso SSH para instalaçãod de recursos na instancia. 
    
###  Recursos na instancia:
    1. Instala um servidor Web Apache;
    2. Instala o Git;
    3. Configura o Apache para iniciar automaticamente após a reinicialização da instância;
    4. Realiza um git clone do código-fonte de um repositório no Bit Bucket;
    5. Adiciona o código-fonte na pasta raiz do servidor da web na /var/www/html.

