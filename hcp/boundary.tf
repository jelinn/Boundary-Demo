resource "hcp_boundary_cluster" "example" {
  cluster_id = var.boundary_cluster_name
  username   = var.boundary_user_name
  password   = var.boundary_password
  tier 	     = var.boundary_tier
}
