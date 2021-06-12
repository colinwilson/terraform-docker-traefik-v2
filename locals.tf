locals {

  LE_PRODUCTION_URL = "https://acme-v02.api.letsencrypt.org/directory"
  LE_STAGING_URL    = "https://acme-staging-v02.api.letsencrypt.org/directory"

  ACME_STORAGE_PATH = "/etc/traefik/acme/acme.json"

  DNS_RESOLVER_A = "1.1.1.1"
  DNS_RESOLVER_B = "8.8.8.8"

}