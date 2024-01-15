# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Terraform configuration

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.11.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = var.creds.c_id
  client_secret   = var.creds.c_secret
  tenant_id       = var.creds.t_id
  subscription_id = var.creds.s_id
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "westus"
}

module "azurerm-storage-ac" {
  source = "./modules/azurerm-storage-ac"

  resource_group_name = var.resource_group_name
  name                = var.name

}
