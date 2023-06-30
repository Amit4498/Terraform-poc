# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = "~> 1.4.6"
}

provider "azurerm" {
  features {}
  client_id       = var.creds.c_id
  client_secret   = var.creds.c_secret
  tenant_id       = var.creds.t_id
  subscription_id = var.creds.s_id
}

#creating RG

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "westus2"

  tags = {
    Environment = "Terraform Getting Started"
    Team        = "DevOps"
  }
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "first_vnet_for_first_rg_by_terraform"
  address_space       = ["10.0.0.0/16"]
  location            = "westus2"
  resource_group_name = azurerm_resource_group.rg.name
}


resource "azurerm_resource_group" "rg2" {
  name     = "second_rg_by_terraform_test"
  location = "westus2"
}

resource "azurerm_virtual_network" "vnet2" {
  name                = "second_vnet_for_second_rg_by_terraform"
  address_space       = ["10.0.0.0/16"]
  location            = "westus2"
  resource_group_name = azurerm_resource_group.rg2.name
}
