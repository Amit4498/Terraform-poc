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
  name     = var.rg.name
  location = var.rg.loc
}

resource "azurerm_storage_account" "st" {
  name                     = "teststoragebyterra"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "asp" {
  name                = "azure-functions-test-service-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "func" {
  name                       = "test-azure-functions-by-amit"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_app_service_plan.asp.id
  storage_account_name       = azurerm_storage_account.st.name
  storage_account_access_key = azurerm_storage_account.st.primary_access_key
}



