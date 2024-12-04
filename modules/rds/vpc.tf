resource "aws_vpc" "mi_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "MiVPC"
  }
}

resource "aws_subnet" "subnet_publica_1" {
  vpc_id            = aws_vpc.mi_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "SubnetPublica1"
  }
}

resource "aws_subnet" "subnet_publica_2" {
  vpc_id            = aws_vpc.mi_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "SubnetPublica2"
  }
}

resource "aws_internet_gateway" "mi_igw" {
  vpc_id = aws_vpc.mi_vpc.id

  tags = {
    Name = "MiInternetGateway"
  }
}

resource "aws_route_table" "mi_route_table_publica" {
  vpc_id = aws_vpc.mi_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mi_igw.id
  }

  tags = {
    Name = "RouteTablePublica"
  }
}

resource "aws_route_table_association" "rta_subnet_publica_1" {
  subnet_id      = aws_subnet.subnet_publica_1.id
  route_table_id = aws_route_table.mi_route_table_publica.id
}

resource "aws_route_table_association" "rta_subnet_publica_2" {
  subnet_id      = aws_subnet.subnet_publica_2.id
  route_table_id = aws_route_table.mi_route_table_publica.id
}