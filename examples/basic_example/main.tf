terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
  required_version = ">= 0.13"
}

provider "docker" {
  # If connecting to a remote host from a local machine running Terraform, ensure your ~/.ssh/config specifies the correct host/key for authentication
  # See - https://github.com/terraform-providers/terraform-provider-docker/issues/268
  host = var.docker_host_url
}

module "docker-traefik" {
  source = "github.com/colinwilson/terraform-docker-traefik-v2"

  acme_email            = var.acme_email
  hostname              = var.hostname
  live_traefik_ssl_cert = true # Use a live SSL certificate for the Traefik dashboard
}