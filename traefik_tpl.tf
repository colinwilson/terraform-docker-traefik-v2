data "template_file" "cloudflare-yaml" {
  template = file("${path.module}/cert_resolvers/dnsChallenge/cloudflare.yaml")

  vars = {
    acme_email           = var.acme_email
    lets_encrypt_keytype = var.lets_encrypt_keytype
    le_production_url    = local.LE_PRODUCTION_URL
    le_staging_url       = local.LE_STAGING_URL
    acme_storage_path    = local.ACME_STORAGE_PATH
    dns_resolver_a       = local.DNS_RESOLVER_A
    dns_resolver_b       = local.DNS_RESOLVER_B
  }
}
