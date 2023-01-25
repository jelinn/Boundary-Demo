resource "boundary_auth_method" "password" {
  name        = "org_auth_method"
  description = "Password auth method for org users"
  type        = "password"
  scope_id    = boundary_scope.personal.id
}

resource "boundary_account_password" "bob_test_account" {
  name           = "bob"
  description    = "Bob - Test password account"
  type           = "password"
  login_name     = "bob"
  password       = var.bob_password
  auth_method_id = boundary_auth_method.password.id
}

resource "boundary_user" "bob" {
  name        = "bob"
  description = "Bob- test user"
  account_ids = [
     boundary_account_password.bob_test_account.id
  ]
  scope_id    = boundary_scope.personal.id
}

resource "boundary_account_password" "alice_test_account" {
  name           = "alice"
  description    = "Alice - Test password account"
  type           = "password"
  login_name     = "alice"
  password       = var.alice_password
  auth_method_id = boundary_auth_method.password.id
}

resource "boundary_user" "alice" {
  name        = "alice"
  description = "Alice- test user"
  account_ids = [
     boundary_account_password.alice_test_account.id
  ]
  scope_id    = boundary_scope.personal.id
}


resource "boundary_account_password" "jelinn_test_account" {
  name           = "jelinn"
  description    = "jelinn- Test password account"
  type           = "password"
  login_name     = "jelinn"
  password       = var.jelinn_password
  auth_method_id = boundary_auth_method.password.id
}

resource "boundary_user" "jelinn" {
  name        = "jelinn"
  description = "jelinn - test user"
  account_ids = [
     boundary_account_password.jelinn_test_account.id
  ]
  scope_id    = boundary_scope.personal.id
}