resource "boundary_group" "admin" {
  name        = "admin"
  description = "Admin users - all personal machines"
  member_ids  = [boundary_user.jelinn.id]
  scope_id    = boundary_scope.personal.id
}

resource "boundary_group" "admin_cloud" {
  name        = "cloud_admin"
  description = "Admin users - Cloud"
  member_ids  = [boundary_user.jelinn.id]
  scope_id    = boundary_scope.cloud_services.id
}

resource "boundary_group" "admin_home" {
  name        = "home_admin"
  description = "Admin users - Home"
  member_ids  = [boundary_user.jelinn.id]
  scope_id    = boundary_scope.home_servers.id
}

resource "boundary_group" "cloud" {
  name        = "cloud"
  description = "Cloud Services"
  member_ids  = [boundary_user.bob.id, boundary_user.jelinn.id]
  scope_id    = boundary_scope.cloud_services.id
}

resource "boundary_group" "home" {
  name        = "home"
  description = "Home machines"
  member_ids  = [boundary_user.alice.id, boundary_user.jelinn.id]
  scope_id    = boundary_scope.home_servers.id
}


