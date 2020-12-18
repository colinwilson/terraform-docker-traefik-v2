# Create Traefik Docker service
resource "docker_service" "traefik" {
  name = "traefik"

  task_spec {
    container_spec {
      image = "traefik:${var.traefik_version}"

      env = {
        # Cloudflare API Tokens for Let's Encrypt DNS Challange
        CF_DNS_API_TOKEN  = var.cloudflare_dns_token
        CF_ZONE_API_TOKEN = var.cloudflare_zone_token
        CF_API_EMAIL      = var.cloudflare_email
        CF_API_KEY        = var.cloudflare_api_key
      }

      labels {
        label = "traefik.enable"
        value = true
      }

      labels {
        label = "traefik.http.routers.http_catchall.rule"
        value = "HostRegexp(`{any:.+}`)"
      }

      labels {
        label = "traefik.http.routers.http_catchall.entrypoints"
        value = "http"
      }

      labels {
        label = "traefik.http.routers.http_catchall.middlewares"
        value = "https_redirect"
      }

      labels {
        label = "traefik.http.middlewares.https_redirect.redirectscheme.scheme"
        value = "https"
      }

      labels {
        label = "traefik.http.middlewares.https_redirect.redirectscheme.permanent"
        value = true
      }

      labels {
        label = "traefik.http.routers.traefik.rule"
        value = "Host(`${var.hostname}`)"
      }

      labels {
        label = "traefik.http.routers.traefik.entrypoints"
        value = "https"
      }

      labels {
        label = "traefik.http.routers.traefik.tls.certresolver"
        value = var.live_cert == false ? "letsEncryptStaging" : "letsEncrypt"
      }

      labels {
        label = "traefik.http.middlewares.traefik-basic-auth.basicauth.users"
        value = "admin:${bcrypt(var.password)}"
      }

      labels {
        label = "traefik.http.middlewares.traefik-basic-auth.basicauth.removeheader"
        value = true
      }

      labels {
        label = "traefik.http.routers.traefik.middlewares"
        value = "traefik-basic-auth"
      }

      labels {
        label = "traefik.http.routers.traefik.service"
        value = "api@internal"
      }

      # Promerheus Metrics config
      labels {
        label = "traefik.http.routers.metrics.rule"
        value = "Host(`traefik`) && PathPrefix(`/metrics`)"
      }

      labels {
        label = "traefik.http.routers.metrics.entrypoints"
        value = "http"
      }

      labels {
        label = "traefik.http.routers.metrics.service"
        value = "prometheus@internal"
      }

      labels {
        label = "traefik.http.routers.metrics.middlewares"
        value = "traefik-basic-auth"
      }

      configs {
        config_id   = docker_config.traefik-yaml.id
        config_name = docker_config.traefik-yaml.name
        file_name   = "/traefik.yaml"
      }

      mounts {
        target    = "/var/run/docker.sock"
        source    = "/var/run/docker.sock"
        type      = "bind"
        read_only = true
      }

      mounts {
        source    = docker_volume.traefik_acme.name
        target    = "/etc/traefik/acme"
        type      = "volume"
        read_only = false
      }
    }
    networks = var.networks
  }

  endpoint_spec {
    ports {
      target_port    = "80"
      published_port = "80"
      publish_mode   = "host"
    }
    ports {
      target_port    = "443"
      published_port = "443"
      publish_mode   = "host"
    }
  }
}
