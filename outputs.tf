output "arn" {
  description = "The ARN of the certificate"
  value = var.wait_for_validation ? aws_acm_certificate_validation.validation.certificate_arn : aws_acm_certificate.cert.arn
}
