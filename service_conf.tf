resource "docker_config" "traefik-yaml" {
  name = "traefik-yaml-${replace(timestamp(), ":", ".")}"
  data = base64encode(templatefile("${path.module}/traefik.yaml", {
    cf_resolver          = contains(var.lets_encrypt_resolvers, "cloudflare") ? data.template_file.cloudflare-yaml.rendered : ""
    traefik_network      = var.traefik_network
    acme_email           = var.acme_email
    lets_encrypt_keytype = var.lets_encrypt_keytype
    le_production_url     = local.LE_PRODUCTION_URL
    le_staging_url        = local.LE_STAGING_URL
    acme_storage_path     = local.ACME_STORAGE_PATH
  }))

  lifecycle {
    ignore_changes        = [name]
    create_before_destroy = true
  }
}