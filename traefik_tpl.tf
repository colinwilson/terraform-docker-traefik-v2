data "local_file" "traefik-yaml" {
  filename = "${path.module}/traefik.yaml"
}
data "template_file" "traefik-yaml" {
  template = "${file("${path.module}/traefik.yaml")}"

  vars = {
    traefik_network  = var.traefik_network
    acme_email       = var.acme_email
    lets_encrypt_env = var.lets_encrypt_env == "staging" ? "https://acme-staging-v02.api.letsencrypt.org/directory" : "https://acme-v02.api.letsencrypt.org/directory"
  }
}