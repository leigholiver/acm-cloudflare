# acm-cloudflare
Terraform module to provide an ACM certificate validated by a Cloudflare DNS challenge


## Variables
| Name | Description | Default |
|---|---|---|---|
| `cloudflare_zone` | Cloudflare zone ID | |
| `domain_name` | Domain name for which the certificate should be issued | |
| `subject_alternative_names` | (Optional) List of domain names that should be SANs in the issued certificate | `[]` |
| `tags` | (Optional) A map of tags to assign to the certificate resource | `{}` |
| `wait_for_validation` | (Optional) Whether to wait for the certificate to become valid | `true` |


## Outputs
| Name | Description |
|---|---|
| `arn` | The ARN of the certificate |
