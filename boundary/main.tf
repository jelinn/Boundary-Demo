terraform {
  required_providers {
    boundary = {
      source  = "hashicorp/boundary"
  }
}
}

data "tfe_outputs" "boundary_deploy" {
  organization = var.tfc_org
  workspace = var.boundary_deploy_workspace
}

provider "boundary" {
  addr                            = data.tfe_outputs.boundary_deploy.Boundary_URL
  auth_method_id                  = var.boundary_auth_method_id
  password_auth_method_login_name = var.boundary_user_name 
  password_auth_method_password   = var.boundary_password 
}