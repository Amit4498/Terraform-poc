

resource "azurerm_storage_account" "st_a" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = "westus"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging-a"
  }
}