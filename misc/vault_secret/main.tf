terraform {
  backend "s3" {
    bucket = "terraform-111"
    key    = "vault-secrets/terraform.tfstate"
    region = "us-east-1"

  }
}

provider "vault" {
  address         = "http://vault-internal.rdevopsb72.shop:8200"
  token           = var.vault_token
  skip_tls_verify = true
}

variable "vault_token" {}