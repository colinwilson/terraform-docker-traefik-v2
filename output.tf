output "acme_volume_mountpoint" {
  description = "Mount point of the ACME certificates storage volume"
  value       = docker_volume.traefik_acme.mountpoint
}

output "traefik_network_name" {
  description = "Name of the Traefik overlay network"
  value       = docker_network.network.name
}

output "traefik_service_config_name" {
  description = "Name of generated Traefik configuration file"
  value       = docker_config.traefik-yaml.name
}