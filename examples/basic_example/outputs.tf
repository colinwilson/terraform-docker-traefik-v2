output "traefik_network_name" {
  description = "Traefik overlay network name"
  value       = module.docker-traefik.traefik_network_name
}
output "acme_mountpoint" {
  description = "ACME certificates storage volume mountpoint"
  value       = module.docker-traefik.acme_volume_mountpoint
}

output "traefik_service_config_name" {
  description = "Name of generated Traefik configuration file"
  value       = module.docker-traefik.traefik_service_config_name
}