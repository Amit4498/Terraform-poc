# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "azurerm" {
  features {}
  client_id       = var.creds.c_id
  client_secret   = var.creds.c_secret
  tenant_id       = var.creds.t_id
  subscription_id = var.creds.s_id
}

# cretion of tags
resource "random_id" "id" {
  byte_length = 8
}

locals {
  name = (var.name != "" ? var.name : random_id.id.hex)
  loc  = var.rg.loc
  common_tags = {
    loc  = local.loc
    Name = local.name
  }
}

# Azure static app creation

resource "azurerm_resource_group" "rg" {
  name     = var.rg.name
  location = var.rg.loc
  # Remember here we have used local.common_tags and not locals.common_tags
  tags = local.common_tags

}


resource "azurerm_static_site" "example" {
  name                = "static-app-test-by-terraform"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  # Remember here we have used local.common_tags and not locals.common_tags
  tags = local.common_tags

}

resource "azurerm_container_registry" "acr" {
  name                = (var.name_condition == true ? "truename" : "falsename")
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = false
  tags                = merge(local.common_tags)

}

