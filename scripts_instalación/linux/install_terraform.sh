#!/bin/bash

# Variables
TERRAFORM_VERSION="1.5.6"  # Cambia por la versión que desees instalar

# Paso 1: Actualizar el sistema
echo "Actualizando el sistema..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Paso 2: Descargar Terraform CLI
echo "Descargando Terraform CLI..."
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -O /tmp/terraform.zip

# Paso 3: Instalar unzip si no está instalado
echo "Verificando si unzip está instalado..."
if ! command -v unzip &> /dev/null; then
    echo "Instalando unzip..."
    sudo apt-get install unzip -y
fi

# Paso 4: Descomprimir Terraform
echo "Descomprimiendo Terraform..."
sudo unzip /tmp/terraform.zip -d /usr/local/bin/

# Paso 5: Verificar la instalación
echo "Verificando la instalación de Terraform..."
if terraform -version &> /dev/null; then
    echo "Terraform se instaló correctamente:"
    terraform -version
else
    echo "Error: Terraform no se instaló correctamente."
    exit 1
fi

# Paso 6: Limpieza
echo "Limpiando archivos temporales..."
rm /tmp/terraform.zip

echo "Instalación de Terraform completada exitosamente."

