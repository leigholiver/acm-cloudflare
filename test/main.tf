terraform {
  backend "local" {}
}

provider "aws" {
  region = var.aws_region
}

provider "cloudflare" {
  email      = var.email
  api_key    = var.api_key
  account_id = var.account_id
}

module "cert" {
  source = "../"

  cloudflare_zone           = var.cloudflare_zone
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names

  tags = {
    terraform = "true"
  }
}
