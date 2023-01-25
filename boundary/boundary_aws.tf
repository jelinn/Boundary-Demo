resource "boundary_host_catalog_plugin" "aws_example" {
  name            = "AWS Dynamic Catalog"
  description     = "AWS Dynamic Catalog - us-east-1"
  scope_id        = boundary_scope.cloud-services.id
  plugin_name     = "aws"
  attributes_json = jsonencode({ "region" = "us-east-1" })

  # recommended to pass in aws secrets using a file() or using environment variables
  # the secrets below must be generated in aws by creating a aws iam user with programmatic access
  secrets_json = jsonencode({
    "access_key_id"     = var.boundary_aws_access_key,
    "secret_access_key" = var.boundary_aws_secret_access_key
  })
}