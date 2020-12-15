# terraform-docker-traefik-v2
An opinionated Terraform module to provision a [Traefik v2](https://containo.us/traefik/) reverse proxy/load balancer container on a Docker host in Swarm mode. See the variables file for the available configuration options.

![](https://res.cloudinary.com/qunux/image/upload/v1607987856/traefik-screenshot_e9nz39.webp)

## Tutorial

TBA
## Compatibility

This module is meant for use with Terraform 0.13 or higher.


## Features
* [x] Create a Traefik load balancer/proxy service on a **Docker Swarm mode** host
* [x] Support for **multiple** (optional) Let's Encrypt [`dnsChallenge`](https://doc.traefik.io/traefik/https/acme/#dnschallenge) providers
* [x] Traefik dashboard enabled and protected by HTTP **Basic Auth**. Configurable password
* [x] Acquire (generate) HTTPS certificates automatically (including renewals) with [Let's Encrypt](https://letsencrypt.org/) via **Docker labels**.
* [x] Example deployment repository
* [ ] Include additional `dnsChallenge` providers
* [ ] Document optional `dnsChallenge` variables

## Traefik Configuration

* HTTP --> HTTPS redirect enabled
* Production & Staging Let's Encrypt [`httpChallenge`](https://doc.traefik.io/traefik/https/acme/#httpchallenge) resolvers configured by default (label values are `letsEncrypt` and `letsEncryptStaging` respectively)
* Support for `dnsChallenge` optional providers (currently supported: `cloudflare`)
* Dashboard enabled and protected by [Basic Auth middleware](https://doc.traefik.io/traefik/middlewares/basicauth/)
* Containers balanced/proxied by Traefik are **not** exposed by default. Containers are exposed using the `traefik.enabled` label
* Port 80/443 published in `host` mode to allow client IP forwarding
* Prometheus metrics enabled (/metrics)

## Usage

Basic usage of this module is as follows:

```hcl
module "docker-traefik" {
  source = "github.com/colinwilson/terraform-docker-traefik-v2"

  password                   = "my_password"
  traefik_network_attachable = true
  acme_email                 = "myemail@example.com"
  hostname                   = "traefik.example.com"
  live_traefik_ssl_cert      = true
  lets_encrypt_keytype       = "EC384"
  lets_encrypt_resolvers     = ["cloudflare"]
}
```

A Functional example is included in the
[examples](./examples/) directory or clone the **docker-traefik** branch [here](https://github.com/colinwilson/example-terraform-modules)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

### Required

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| hostname | Hostname for Traefik. | string | n/a | yes |
| acme_email | Let's Encrypt registration email | string | n/a | yes |

### Optional

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| networks | List of networks Traefik should connect to. | list(string) | `"traefik"` | no |
| traefik_network | Name of Traefik (Docker overlay) network. | string | `"traefik"` | no |
| traefik_network_attachable | Make the default Traefik network attachable. | bool | `false` | no |
| traefik_version | Which Traefik Docker image version to use. | string | `"2.3.5"` | no |
| password | Password to login to Traefik dashboard (username: admin). | string | `"traefik"` | no |
| live_traefik_ssl_cert | Deploy Traefik with a live SSL cert. | bool | `"false"` | no |
| lets_encrypt_keytype | SSL cert key type to issue certs with. | string |`"RSA2048"` | no |
| lets_encrypt_resolvers | List of DNS Challange providers to enable. | list(string) | `[]`| no |

## Outputs

| Name | Description |
|------|-------------|
| acme_volume_mountpoint | Mount point of the ACME certificates storage volume. |
| traefik_network_name | Name of the Traefik network. |
| traefik_service_config_name | File name of the Traefik configuration file. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform](https://www.terraform.io/downloads.html) v0.13
- [Terraform Provider for Docker](https://registry.terraform.io/providers/kreuzwerker/docker/latestt) version 2.8.x


