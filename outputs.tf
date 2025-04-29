output "instance_public_ip" {
  value = aws_instance.vulhub_instance.public_ip
}

output "instance_id" {
  value = aws_instance.vulhub_instance.id
}
