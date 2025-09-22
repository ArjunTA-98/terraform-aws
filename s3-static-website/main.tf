provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "arjun_website" {
  bucket = var.bucket_name

  tags = {
    Name    = "Arjun_Test_S3_Bucket"
    Project = "TF-AWS-Automation"
  }
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.arjun_website.id

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}