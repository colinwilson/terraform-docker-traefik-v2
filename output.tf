output "acme_volume_mountpoint" {
  value = docker_volume.traefik_acme.mountpoint
}

output "traefik_network_name" {
  value  = docker_network.network.name
}

output "traefik_service_config_name" {
  value = docker_config.traefik-yaml.name
}