# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "azurerm" {
  features {}
  client_id       = var.creds.c_id
  client_secret   = var.creds.c_secret
  tenant_id       = var.creds.t_id
  subscription_id = var.creds.s_id
}

resource "random_pet" "object_names" {
  count = 4

  length    = 5
  separator = "_"
  prefix    = "learning"
}

resource "random_pet" "bucket_name" {
  length    = 5
  separator = "-"
  prefix    = "learning"
}

/*
using exsting rg
resource "azurerm_resource_group" "rg" {
  name     = var.rg.name
  location = var.rg.location
}
*/

data "azurerm_resource_group" "rg" {
  name = "Container-RG"
}


data "azurerm_service_plan" "plan" {
  name                = "ASP-ContainerRG-a0b4"
  resource_group_name = data.azurerm_resource_group.rg.name
}

/*
Azure fre app serive plan in only 1 applicable.
resource "azurerm_service_plan" "plan" {
  name                = "aspfortestlinusappser"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "s1"
}

*/

resource "azurerm_linux_web_app" "app_ser" {
  name                = random_pet.bucket_name.id
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_service_plan.plan.location
  service_plan_id     = data.azurerm_service_plan.plan.id

  site_config {
    always_on = false
  }

  tags = {
    name = "Bucket object "
  }
}


