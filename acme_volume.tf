# Create docker volume for acme.json storage
resource "docker_volume" "traefik_acme" {
  name = "traefik_acme"
}