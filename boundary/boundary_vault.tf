# resource "boundary_credential_store_vault" "vault" {
#   name        = "hcp_vault"
#   description = "HCP Vault credential store"
#   address     = var.vault_addr
#   token       = var.vault_token
#   scope_id    = boundary_scope.home_servers.id
# }