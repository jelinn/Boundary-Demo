resource "boundary_credential_store_vault" "vault" {
  name        = "hcp_vault"
  description = "HCP Vault credential store"
  address     = var.hcp_vault_addr
  token       = var.hcp_vault_token
  scope_id    = boundary_scope.home_servers.id
}