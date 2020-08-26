terraform {
    required_providers {
        docker = {
            source = "terraform-providers/docker"
        }
    }
    required_version = ">= 0.12.20, <= 0.13"
}