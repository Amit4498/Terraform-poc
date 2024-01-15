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
  name     = var.test_rg
  location = var.test_rg_loc
}

data "azurerm_network_security_group" "example" {
  name                = "example"
  resource_group_name = azurerm_resource_group.rg.name
}

output "location" {
  value = data.azurerm_network_security_group.example.location
}

resource "azurerm_virtual_network" "vent" {
  name                = "test-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = data.azurerm_network_security_group.example.id
  }

  tags = {
    environment = "Production"
  }
}