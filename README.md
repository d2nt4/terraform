# Terraform AWS Project: EC2 and RDS Deployment
Repositorio de Terraform para la asignatura de Arquitectura Orientada a Servicios (AOS).
## Descripción
Este proyecto implementa la automatización del despliegue de recursos en AWS utilizando **Terraform**. Los recursos principales incluyen:

- **EC2 (Elastic Compute Cloud):** Instancias virtuales configuradas para alojar servicios o aplicaciones.
- **RDS (Relational Database Service):** Base de datos gestionada para almacenar información de manera eficiente.

El proyecto está organizado modularmente para garantizar la reutilización y la escalabilidad.

---

## Estructura del Proyecto

```plaintext
modules/
│
├── ec2/
│   ├── .terraform.lock.hcl
│   ├── ec2.tf            # Definición de la instancia EC2.
│   ├── variables.tf      # Variables específicas para EC2.
│
├── rds/
│   ├── rds.tf            # Configuración del servicio RDS.
│   ├── variables.tf      # Variables específicas para RDS.
│   ├── vpc.tf            # Configuración de red (VPC) para RDS.
│
├── scripts/linux/
│   ├── install_terraform.sh # Script para instalar Terraform en sistemas Linux.
│
├── .gitignore            # Archivos y carpetas ignorados por Git.
├── .terraform.lock.hcl   # Archivo de bloqueo de dependencias.
├── README.md             # Este archivo.
├── main.tf               # Configuración principal de Terraform.
├── terraform.tfvars.txt  # Variables específicas del entorno.
├── variables.tf          # Variables globales del proyecto.
```
## Requisitos
### Pre-requisitos:

- Cuenta de AWS con permisos suficientes para crear recursos.
- Terraform instalado en el sistema.
- Claves de acceso (Access Key y Secret Key) configuradas para la CLI de AWS.

### Software recomendado:

- AWS CLI para gestión directa.
- Editor de código como Visual Studio Code o IntelliJ IDEA.

## Configuración
### Variables:

Personaliza el archivo terraform.tfvars.txt con tus valores:
```hcl
aws_access_key = "TU_ACCESS_KEY"
aws_secret_key = "TU_SECRET_KEY"
region         = "us-east-1"
```

## Inicialización del proyecto:

Ejecuta:
```bash
terraform init
```
## Planificación:

Genera un plan para revisar los cambios:
```bash
terraform plan
```
## Despliegue:

Aplica los cambios para crear los recursos:
```bash
terraform apply
```

## Módulos
### EC2
El módulo ec2 gestiona:

- Creación de una instancia EC2.
- Configuración de claves SSH.
- Opciones personalizables como tipo de instancia, imagen AMI y más.

### RDS
El módulo rds incluye:

- Creación de una base de datos RDS.
- Configuración de red mediante VPC.
- Parámetros iniciales como motor de base de datos, usuario y contraseña.

## Script de Instalación
En la carpeta scripts/linux/ se encuentra un script (install_terraform.sh) para instalar Terraform en sistemas Linux. Ejecuta:
```bash
bash scripts/linux/install_terraform.sh
```

## Limpieza
Para eliminar los recursos creados, ejecuta:
```bash
terraform destroy
```
