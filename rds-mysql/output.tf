output "db_instance_identifier" {
  value = aws_db_instance.arjun_test_db.id
}

output "db_endpoint" {
  value = aws_db_instance.arjun_test_db.endpoint
}