resource "aws_instance" "app_server" {
  count         = 3
  ami           = "ami-0505148b3591e4c07"
  instance_type = "t2.micro"
  subnet_id     = var.public_subnets[count.index]
  key_name = "micro-key"

  tags = {
    Name = "microservice_${count.index + 1}"
  }
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.security_group_id]
}
