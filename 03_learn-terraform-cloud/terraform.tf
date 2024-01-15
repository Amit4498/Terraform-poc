terraform {

  cloud {
    organization = "test-org-by-amit"

    workspaces {
      name = "learn-terraform-cloud"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = "~>1.4.6"
}
