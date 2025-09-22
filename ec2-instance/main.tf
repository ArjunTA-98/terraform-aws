provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "arjun_test_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Arjun_Test_Instance"
    Project = "TF-AWS-Automation"
  }
}