resource "docker_config" "traefik-yaml" {
  name = "traefik-yaml-${replace(timestamp(), ":", ".")}"
  data = base64encode(data.template_file.traefik-yaml.rendered)

  lifecycle {
    ignore_changes        = [name]
    create_before_destroy = true
  }
}