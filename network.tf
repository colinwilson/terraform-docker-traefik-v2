# Create a new docker network for traefik
resource "docker_network" "network" {
  name            = var.traefik_network
  attachable      = var.traefik_network_attachable
  driver          = "overlay"
  check_duplicate = true
}