locals {

  LE_PRODUCTION_URL = "https://acme-v02.api.letsencrypt.org/directory"
  LE_STAGING_URL    = "https://acme-staging-v02.api.letsencrypt.org/directory"

  ACME_STORAGE_PATH = "/etc/traefik/acme/acme.json"

  CF_DNS_RESOLVER_A = "1.1.1.1"
  CF_DNS_RESOLVER_B = "1.0.0.1"

  GOOGLE_DNS_RESOLVER_A = "8.8.8.8"
  GOOGLE_DNS_RESOLVER_B = "8.8.4.4"

  QUAD9_DNS_RESOLVER_A = "9.9.9.9"
  QUAD9_DNS_RESOLVER_B = "149.112.112.112"

  LEVEL3_DNS_RESOLVER_A = "209.244.0.3"
  LEVEL3_DNS_RESOLVER_B = "209.244.0.4"

}