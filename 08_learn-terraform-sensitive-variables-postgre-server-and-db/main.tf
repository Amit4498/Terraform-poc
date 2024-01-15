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
  location = var.rg.location
}

resource "azurerm_postgresql_server" "ps_ser" {
  name                = var.ps_server_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku_name = "B_Gen5_2"

  storage_mb                   = 10240
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login           = var.ps_server.username
  administrator_login_password  = var.ps_server.pass
  version                       = "11"
  ssl_enforcement_enabled       = false
  public_network_access_enabled = true

  ssl_minimal_tls_version_enforced = "TLSEnforcementDisabled"
}

resource "azurerm_postgresql_database" "example" {
  name                = "exampledb"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_postgresql_server.ps_ser.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
