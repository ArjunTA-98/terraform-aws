provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  default = "us-east-1"
}

variable "db_name" {
  default = "Arjun_Test_DB"
}

variable "db_username" {
  default = "adminuser"
}

variable "db_password" {
  default = "Arjun@123!" #need to change this before executing
}

variable "db_instance_class" {
  default = "db.t3.micro"
}

resource "aws_db_instance" "arjun_test_db" {
  identifier = var.db_name
  allocated_storage = 20
  engine  = "mysql"
  engine_version = "8.0"
  instance_class = var.db_instance_class
  db_name = var.db_name
  username = var.db_username
  password = var.db_password
  skip_final_snapshot = true

  publicly_accessible = true
  tags = {
    Name = var.db_name
    Project = "TF-AWS-Automation"
  }
}