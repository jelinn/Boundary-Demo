
resource "boundary_role" "manage_personal" {
  name        = "manage_personal"
  description = "Manage all personal resources"
  scope_id    = boundary_scope.personal.id
  principal_ids   = [boundary_group.admin.id]
  grant_strings   = ["id=*;type=*;actions=read,list"]
}

resource "boundary_role" "manage_cloud" {
  name        = "manage_cloud"
  description = "Manage cloud resources"
  scope_id    = boundary_scope.cloud_services.id
  principal_ids   = [boundary_user.bob_test_account.id]
  grant_strings   = ["id=*;type=*;actions=read,list"]
}

resource "boundary_role" "manage_home" {
  name        = "manage_home"
  description = "Manage home resources"
  scope_id    = boundary_scope.home_servers.id
  principal_ids   = [boundary_user.alice_test_account.id]
  grant_strings   = ["id=*;type=*;actions=read,list"]
}