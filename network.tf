# Create a new docker network for traefik
resource "docker_network" "network" {
  name            = var.traefik_network
  driver          = "overlay"
  check_duplicate = true
}