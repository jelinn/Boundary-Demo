terraform {
  required_providers {
    boundary = {
      source  = "hashicorp/boundary"
  }
}
}
#provider "vault"{}


provider "boundary" {
  addr                            = var.boundary_addr
  auth_method_id                  = var.boundary_auth_method_id
  password_auth_method_login_name = var.boundary_user_name 
  password_auth_method_password   = var.boundary_password 
}