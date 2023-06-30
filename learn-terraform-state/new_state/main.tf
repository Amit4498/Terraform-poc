
terraform {
  /* Uncomment this block to use Terraform Cloud for this tutorial
cloud {
    organization = "organization-name"
    workspaces {
      name = "learn-terraform-sensitive-variables"
    }
}
*/
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = "~> 1.4.6"
}


variable "rg" {
  description = "The azure rg  resources"
  type        = map(string)
  default = {
    name     = "tesrtrgbytf"
    location = "east us"
  }

}

variable "creds" {
  description = "creds"
  type        = map(string)
}


provider "azurerm" {
  features {}
  client_id       = var.creds.c_id
  client_secret   = var.creds.c_secret
  tenant_id       = var.creds.t_id
  subscription_id = var.creds.s_id
}


data "azurerm_resource_group" "rg" {
  name     = var.rg.name
}

data "terraform_remote_state" "root" {
  backend = "local"

  config = {
    path = "../terraform.tfstate"
  }
}

resource "azurerm_virtual_network" "vnet2" {
  name                = "test-vnet2"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  tags = {
    environment = "Production"
  }
}


output "vnet" {
  value = azurerm_virtual_network.vnet2.name
}
