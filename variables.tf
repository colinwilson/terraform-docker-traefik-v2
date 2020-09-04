# Required variables
variable "hostname" {
  type        = string
  description = "Hostname for accessing Traefik e.g. traefik.example.com"
}

variable "acme_email" {
  type        = string
  description = "Let's Encrypt email address used for registration."
}

# Optional variables
variable "networks" {
  type        = list
  description = "List of networks to connect Traefik to."
  default     = ["traefik"]
}

variable "traefik_network" {
  type        = string
  description = "Traefik (Docker overlay) network name."
  default     = "traefik"
}

variable "traefik_version" {
  type        = string
  description = "Traefik Docker image version."
  default     = "2.2.8"
}

variable "password" {
  type        = string
  description = "Password to login to Traefik dashboard (username: admin)"
  default     = "traefik"
}

variable "lets_encrypt_env" {
  type        = string
  description = "The Let's Encrypt environment to use when requesting the SSL certificate for Traefik: staging, production"
  default     = "staging" # Prevents hitting Let's Encrypts rate limit when testing.
  validation {
    condition     = length(regexall("^staging|production$", var.lets_encrypt_env)) > 0
    error_message = "Let's Encrypt enviroment variable should be staging or production."
  }
}
