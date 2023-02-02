resource "boundary_credential_store_vault" "vault" {
  name        = "hcp_vault"
  description = "HCP Vault credential store"
  address     = var.vault_addr
  token       = var.vault_token
  scope_id    = boundary_scope.home_servers.id
}


resource "boundary_credential_library_vault" "postgres" {
  name                = "Postgres"
  description         = "Cred library for postgres"
  credential_store_id = boundary_credential_store_vault.vault.id
  path                = var.vault_postgres_boundary
  http_method         = "GET"
}


resource "boundary_credential_library_vault" "ssh_ubuntu" {
  name                = "SSH Ubunutu Library"
  description         = "SSH Ubunutu"
  credential_store_id = boundary_credential_store_vault.vault.id
  path                = var.vault_ssh_path
  http_method         = "POST"
  http_request_body        = <<EOT
    {
      "public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNVVMbU2AOe37He8wRYEpOr5C1NUlqCySpx65Bn23nNc2I3JTTPvdlOeHACbJjUM++WXXebU488EHuZBwBE6Qb7eRLzeIjNWGZr2Qdk3Jz8kYkH2wEhgo0sZaZhNxEHLlXqliyL1Jv7x2o/rI98Ld89DcIP0S3oeD2q0iSFVupgQ9ZENGbqSsgVtftRE6CvADaYtcIeFitl4O3jdMIHoLAIuZ0CuOabLLK5vJNfepXIHGLhkheEw9jJCGJOmE9ITu5TozbBQ2uwgWWxLYBiI/ziuB77YHNi8GVOX90X4ZTP9UWINF0bnJjml1qdG9xdAz1rSqfxwrkO12faEEpfIMHFM86DQdYqEcVZQzEQIODJPaxPXhBYCoGVpYmz8XHF+0pSs2LRSdE/40rHqW3R5prA5TM1zI3X410CaUQeL3t8/ycFA1w9LOAydJ+vB1bQG62yYY7JyUF6x44beXTuIoqtLEmlcZl8QJQ0dm7mfGJJ9xLkqBv13S8lrP2DlUoEVU= jelinn@jelinn-N7K92N33H0"
    }
    EOT
}