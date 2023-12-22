resource "aws_instance" "dev-ec2-1" {
  ami           = "ami-079db87dc4c10ac91"
  instance_type = "t2.micro"
  tenancy       = "default"
  key_name      = "dev-1-kp"
  security_groups = [
    "ssh-allowed"
  ]
  tags = {
    Name = "dev-ec2-1"
  }
}
