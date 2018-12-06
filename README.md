Configure Google Cloud Firewall Rules

- allow all traffic inbound from ${var.external_source_range}
- allow inbound to Vault Cluster
- allow inbound to Private Terraform
- allow inbound to Consul DNS service
- allow inbound to XL Deploy
