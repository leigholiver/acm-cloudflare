variable "cloudflare_zone" {
  description = "Cloudflare zone ID"
  type        = string
}

variable "domain_name" {
  description = "Domain name for which the certificate should be issued"
  type        = string
}

variable "subject_alternative_names" {
  description = "List of domain names that should be SANs in the issued certificate"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to assign to the certificate resource"
  type        = map(string)
  default     = {}
}

variable "wait_for_validation" {
  description = "Whether to wait for the certificate to become valid"
  type        = bool
  default     = true
}
