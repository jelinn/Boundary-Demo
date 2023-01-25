resource "boundary_scope" "personal" {
  scope_id                 = "global"
  name                     = "Personal"
  description              = "Access to personal machines"
  auto_create_default_role = true
  auto_create_admin_role   = true
}

resource "boundary_scope" "cloud_services" {
  name             = "cloud-services"
  description      = "Manage cloud resources"
  scope_id                 = boundary_scope.personal.id
  auto_create_admin_role   = true
  auto_create_default_role = true
}

resource "boundary_scope" "home_servers" {
  name             = "home-servers"
  description      = "Manage personal home servers"
  scope_id                 = boundary_scope.personal.id
  auto_create_admin_role   = true
  auto_create_default_role = true
}