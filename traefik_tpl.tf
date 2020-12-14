data "template_file" "cloudflare-yaml" {
  template = file("${path.module}/cert_resolvers/dnsChallenge/cloudflare.yaml")

  vars = {
    acme_email            = var.acme_email
    lets_encrypt_keytype  = var.lets_encrypt_keytype
    le_production_url     = local.LE_PRODUCTION_URL
    le_staging_url        = local.LE_STAGING_URL
    acme_storage_path     = local.ACME_STORAGE_PATH
    cf_dns_resolver_a     = local.CF_DNS_RESOLVER_A
    google_dns_resolver_a = local.GOOGLE_DNS_RESOLVER_A
    //cf_dns_resolver_b    = local.CF_DNS_RESOLVER_B
    //google_dns_resolver_b = local.GOOGLE_DNS_RESOLVER_B
  }
}

# data "local_file" "traefik-yaml" {
#   filename = "${path.module}/traefik.yaml"
# }
# data "template_file" "traefik-yaml" {
#   template = "${file("${path.module}/traefik.yaml")}"

#   vars = {
#     traefik_network      = var.traefik_network
#     acme_email           = var.acme_email
#     lets_encrypt_keytype = var.lets_encrypt_keytype
#     lets_encrypt_env     = var.lets_encrypt_env == "staging" ? "https://acme-staging-v02.api.letsencrypt.org/directory" : "https://acme-v02.api.letsencrypt.org/directory"
#   }
# }
