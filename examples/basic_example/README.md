# Basic Example

This example illustrates how to use the `terraform-docker-traefik-v2` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| hostname | Chosen hostname for Traefik. | string | n/a | yes |
| acme_email | Let's Encrypt registration email | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| acme_volume_mountpoint | Mount point of the ACME certificates storage volume. |
| traefik_network_name | Name of the Traefik network. |
| traefik_service_config_name | File name of the Traefik configuration file. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

To provision this example, replace the values in the `variables.tf` file with your own and run the following commands from within this directory:
- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure
