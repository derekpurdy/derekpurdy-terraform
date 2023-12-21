resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.dev-vpc.id

  tags = {
    Name = "dev-igw"
  }
}

resource "aws_route_table" "dev-us-east-1a-public-rt" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-igw.id
  }

  tags = {
    Name = "dev-us-east-1a-public-rt"
  }
}

resource "aws_route_table_association" "dev-us-east-1a-public-rt" {
  subnet_id      = aws_subnet.public_subnet_name.id
  route_table_id = aws_route_table.dev-us-east-1a-public-rt.id
}

resource "aws_security_group" "ssh-allowed" {
  vpc_id      = aws_vpc.dev-vpc.id
  description = "Allow SSH"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.86.241.182/32"]
  }

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["172.86.241.182/32"]
  }
  tags = {
    Name = "ssh-allowed"
  }
}
