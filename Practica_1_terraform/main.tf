provider "aws" {
  region = "us-east-1"  # Cambia esto a tu región preferida
}

# Definir el par de claves (Key Pair)
variable "key_name" {
  description = "Nombre del par de claves para acceder a la instancia"
  default     = "aos-2024"  # Cambia esto por el nombre de tu Key Pair
}

# Crear una instancia EC2
resource "aws_instance" "mi_ec2" {
  ami           = "ami-0c02fb55956c7d316"  # AMI de Amazon Linux 2
  instance_type = "t2.micro"               # Tipo de instancia
  key_name      =  var.key_name            # Par de claves para acceder a la instancia

# Asociar el grupo de seguridad
  vpc_security_group_ids = [aws_security_group.mi_grupo_seguro.id]

  tags = {
    Name = "MiInstanciaEC2"
  }
}

resource "aws_security_group" "mi_grupo_seguro" {
  name        = "mi-grupo-seguro"
  description = "Permitir trafico SSH"

  # Reglas de entrada
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Cambia esto para restringir el acceso a una IP específica
  }

  # Reglas de salida
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Todos los protocolos
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mi-grupo-seguro"
  }
}
