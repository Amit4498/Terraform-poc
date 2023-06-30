# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
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

resource "random_pet" "petname" {
  length    = 4
  separator = "-"
}

resource "azurerm_resource_group" "rg" {
  name     = "example-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "st_dev" {
  name                     = "stacbytfdevenvdevdev"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_kind             = "StorageV2"

  static_website {
    index_document = "index.html"
  }

  tags = {
    environment = var.dev_prefix
  }
}


