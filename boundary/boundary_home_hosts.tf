
resource "boundary_host_catalog_static" "home-personal" {
  name        = "personal"
  description = "For managing personal machines"
  scope_id    = boundary_scope.home-servers.id
}

resource "boundary_host_set_static" "home-personal" {
  name            = "personal-machines"
  description     = "Host set for personal machines"
  host_catalog_id = boundary_host_catalog_static.home-personal.id
  host_ids = [
      boundary_host_static.mac_mini.id
  ]
}

resource "boundary_host_static" "mac_mini" {
  name            = "Mac Mini - Personal"
  description     = "OS X Mac Mini"
  address         = "192.168.1.100"
  host_catalog_id = boundary_host_catalog_static.home-personal.id
}

resource "boundary_target" "mac_mini" {
  type                     = "tcp"
  name                     = "mac_mini"
  description              = "Personal Mac Mini target"
  scope_id                 = boundary_scope.home-servers.id
  session_connection_limit = -1
  default_port             = 22
  host_source_ids = [
    boundary_host_set_static.personal_machines.id
  ]
}