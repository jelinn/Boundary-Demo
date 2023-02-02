resource "vault_namespace" "boundary" {
  path = "boundary"
}

resource "vault_database_secrets_mount" "db" {
  path = "db"

  postgresql {
    name              = "db2"
    username          = "postgres"
    password          = "super_secret_2"
    connection_url    = ""
    verify_connection = true
    allowed_roles = [
      "dev2",
    ]
  }
}


resource "vault_policy" "database_creds" {
  name = "boundary_controller"

  policy = <<EOT

path "database/creds/analyst" {
  capabilities = ["read"]
}

path "database/creds/dba" {
  capabilities = ["read"]
}
EOT
}