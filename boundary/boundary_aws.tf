

resource "boundary_host_catalog_plugin" "aws_example" {
  name            = "personal-aws-us-east-1"
  description     = "Personal cloud resources - us-east-1"
  scope_id        = boundary_scope.cloud_sarvices.id
  plugin_name     = "aws"
  attributes_json = jsonencode({ "region" = "us-east-1" })

  # recommended to pass in aws secrets using a file() or using environment variables
  # the secrets below must be generated in aws by creating a aws iam user with programmatic access
  secrets_json = jsonencode({
    "access_key_id"     = "env://BOUNDARY_ACCESS_KEY_ID",
    "secret_access_key" = "env://BOUNDARY_SECRET_ACCESS_KEY"
  })
}