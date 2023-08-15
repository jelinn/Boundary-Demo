resource "hcp_hvn" "example" {
  hvn_id         = var.hvn_id
  cloud_provider = "aws"
  region         = var.hvn_region
  cidr_block     = var.hvn_cidr
}

resource "hcp_vault_cluster" "example" {
  cluster_id = var.vault_cluster_name
  hvn_id     = hcp_hvn.example.hvn_id
  tier       = var.vault_tier
}
