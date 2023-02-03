# resource "boundary_credential_store_vault" "vault" {
#   name        = "hcp_vault"
#   description = "HCP Vault credential store"
#   address     = var.vault_addr
#   token       = var.vault_token
#   scope_id    = boundary_scope.home_servers.id
# }


# resource "boundary_credential_library_vault" "postgres" {
#   name                = "Postgres"
#   description         = "Cred library for postgres"
#   credential_store_id = boundary_credential_store_vault.vault.id
#   path                = var.vault_postgres_boundary
#   http_method         = "GET"
# }


# resource "boundary_credential_library_vault" "ssh_ubuntu" {
#   name                = "SSH Ubunutu Library"
#   description         = "SSH Ubunutu"
#   credential_store_id = boundary_credential_store_vault.vault.id
#   path                = var.vault_ssh_path
#   http_method         = "POST"
#   http_request_body        = <<EOT
#     {
#       "public_key": ""
#     }
#     EOT
# }