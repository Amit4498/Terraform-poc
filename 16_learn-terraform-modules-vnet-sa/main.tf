# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "azurerm" {
  features {}
  client_id       = var.creds.c_id
  client_secret   = var.creds.c_secret
  tenant_id       = var.creds.t_id
  subscription_id = var.creds.s_id
}

resource "azurerm_resource_group" "rg" {
  name     = "rg_by_terraform_test"
  location = "westus"
}

module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "4.0.0"

  # insert the 3 required variables here

  resource_group_name = azurerm_resource_group.rg.name
  use_for_each        = true
  vnet_location       = "eastus"
}


module "storage_example_complete" {
  source  = "kumarvna/storage/azurerm//examples/complete"
  version = "2.5.0"

}


