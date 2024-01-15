provider "azurerm" {
  features {}
  client_id       = var.creds.c_id
  client_secret   = var.creds.c_secret
  tenant_id       = var.creds.t_id
  subscription_id = var.creds.s_id
}

resource "azurerm_resource_group" "rg" {
  name     = "test_rg"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "app_plan" {
  name                = "test-appserviceplan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_linux_web_app" "example" {
  name                = "test-app-ser-linux-by-terraform"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_app_service_plan.app_plan.location
  service_plan_id     = azurerm_app_service_plan.app_plan.id

  site_config {}

  depends_on = [azurerm_storage_account.st_a]
}

resource "azurerm_storage_account" "st_a" {
  name                     = "stterraforma"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging-a"
  }
}

resource "azurerm_storage_account" "st_b" {
  name                     = "stterraformb"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  depends_on = [azurerm_linux_web_app.example, azurerm_storage_account.st_a]

  tags = {
    environment = "staging-b"
  }
}