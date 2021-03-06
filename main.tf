locals {
  subject_alternative_names = distinct(
    [for s in var.subject_alternative_names : s if s != var.domain_name]
  )
}

resource "aws_acm_certificate" "cert" {
  validation_method         = "DNS"
  domain_name               = var.domain_name
  subject_alternative_names = local.subject_alternative_names
}

resource "aws_acm_certificate_validation" "validation" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in cloudflare_record.dns_records : record.hostname]
}

resource "cloudflare_record" "dns_records" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name = dvo.resource_record_name
      type = dvo.resource_record_type

      # aws asks for the record with a trailing dot, but cloudflare removes it
      # this makes terraform want to constantly recreate the dns record
      record = trim(dvo.resource_record_value, ".")
    }
  }

  zone_id = var.cloudflare_zone
  name    = each.value.name
  value   = each.value.record
  type    = each.value.type
  ttl     = 60
}
