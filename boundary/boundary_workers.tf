resource "boundary_worker" "home"{

    scope_id = boundary_scope.cloud_services.id
    description = "A Boundary worker for home services"
    name = "home_worker_rpi"

}