
resource "boundary_host_catalog_static" "home-personal" {
  name        = "personal"
  description = "For managing personal machines"
  scope_id    = boundary_scope.home_servers.id
}

resource "boundary_host_set_static" "home-personal" {
  name            = "personal-machines"
  description     = "Host set for personal machines"
  host_catalog_id = boundary_host_catalog_static.home-personal.id
  host_ids = [
      boundary_host_static.mac_mini.id,
      boundary_host_static.pi1.id,
      boundary_host_static.pi2.id,
      boundary_host_static.pi3.id,
      boundary_host_static.ubuntu_mini.id
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
  scope_id                 = boundary_scope.home_servers.id
  session_connection_limit = -1
  default_port             = 22
  host_source_ids = [
    boundary_host_set_static.home-personal.id
  ]
}

resource "boundary_host_static" "ubuntu_mini" {
  name            = "Ubuntu-NUC"
  description     = "Ubuntu - Mini NUC"
  address         = "192.168.1.180"
  host_catalog_id = boundary_host_catalog_static.home-personal.id
}

resource "boundary_target" "ubuntu_mini" {
  type                     = "tcp"
  name                     = "ubuntu_mini"
  description              = "Personal Ubuntu Mini target"
  scope_id                 = boundary_scope.home_servers.id
  session_connection_limit = -1
  default_port             = 22
  host_source_ids = [
    boundary_host_set_static.home-personal.id
  ]
}

resource "boundary_host_static" "pi1" {
  name            = "pi1"
  description     = "pi1"
  address         = "192.168.1.200"
  host_catalog_id = boundary_host_catalog_static.home-personal.id
}

resource "boundary_target" "pi1" {
  type                     = "tcp"
  name                     = "pi1"
  description              = "Personal raspbery pi1"
  scope_id                 = boundary_scope.home_servers.id
  session_connection_limit = -1
  default_port             = 22
  host_source_ids = [
    boundary_host_set_static.home-personal.id
  ]
}

resource "boundary_host_static" "pi2" {
  name            = "pi2"
  description     = "pi2"
  address         = "192.168.1.201"
  host_catalog_id = boundary_host_catalog_static.home-personal.id
}

resource "boundary_target" "pi2" {
  type                     = "tcp"
  name                     = "pi2"
  description              = "Personal raspbery pi2 - number 2. Boundary worker"
  scope_id                 = boundary_scope.home_servers.id
  session_connection_limit = -1
  default_port             = 22
  host_source_ids = [
    boundary_host_set_static.home-personal.id
  ]
}

resource "boundary_host_static" "pi3" {
  name            = "pi3"
  description     = "pi3"
  address         = "192.168.1.202"
  host_catalog_id = boundary_host_catalog_static.home-personal.id
}

resource "boundary_target" "pi3" {
  type                     = "tcp"
  name                     = "pi3"
  description              = "Personal raspbery pi3"
  scope_id                 = boundary_scope.home_servers.id
  session_connection_limit = -1
  default_port             = 22
  host_source_ids = [
    boundary_host_set_static.home-personal.id
  ]
}