# Create a new docker network for traefik
resource "docker_network" "traefik" {
  name            = var.traefik_network
  attachable      = var.traefik_network_attachable
  driver          = "overlay"
  check_duplicate = true
}

data "docker_network" "additional_networks" {
  for_each = var.networks
  name     = each.key
}