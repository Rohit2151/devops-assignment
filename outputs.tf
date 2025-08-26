output "ec2_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "ecr_repository_url" {
  value = aws_ecr_repository.app_repo.repository_url
}

output "s3_bucket_name" {
  value = aws_s3_bucket.app_bucket.bucket
}
