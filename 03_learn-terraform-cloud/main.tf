provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.test_rg.name
  location = var.test_rg.loc

  tags = {
    env = var.tag
  }
}


