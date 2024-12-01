provider "aws" {
  region = "us-east-1"  # Cambia la región según tus preferencias
}

# Crear un bucket S3
resource "aws_s3_bucket" "my_bucket" {
  bucket        = "my-bucket"
}

# Subir el archivo index.html al bucket
resource "aws_s3_object" "index_object" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "index.html"
  source = "./index.html"  # Ruta al archivo local
  
}