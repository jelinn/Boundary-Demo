
resource "boundary_role" "manage_personal" {
  name        = "manage_personal"
  description = "Manage all personal resources"
  scope_id    = boundary_scope.personal.id
  principal_ids   = [boundary_group.admin.id]
  grant_strings   = ["id=*;type=*;actions=read,list"]
}

resource "boundary_role" "read_only" {
  name        = "read_only"
  description = "Read only"
  scope_id    = boundary_scope.personal.id
  principal_ids   = [boundary_user.jelinn.id, boundary_user.bob.id, boundary_user.alice.id]
  grant_strings   = ["id=*;type=*;actions=read,list"]
}

resource "boundary_role" "manage_cloud" {
  name        = "manage_cloud"
  description = "Manage cloud resources"
  scope_id    = boundary_scope.cloud_services.id
  principal_ids   = [boundary_user.bob.id]
  grant_strings   = ["id=*;type=*;actions=*"]
}

resource "boundary_role" "manage_home" {
  name        = "manage_home"
  description = "Manage home resources"
  scope_id    = boundary_scope.home_servers.id
  principal_ids   = [boundary_user.alice.id]
  grant_strings   = ["id=*;type=*;actions=*"]
}