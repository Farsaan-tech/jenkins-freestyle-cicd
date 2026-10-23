output "jenkins_public_ip" {
  description = "Public IPv4 address for the lab Jenkins instance"
  value       = aws_instance.jenkins.public_ip
}

output "jenkins_url" {
  description = "Jenkins UI URL; access is limited to admin_cidr"
  value       = "http://${aws_instance.jenkins.public_ip}:8080"
}
