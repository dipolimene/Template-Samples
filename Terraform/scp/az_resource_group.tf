# Creates Resource Group

resource "azurerm_resource_group" "resource_group" {
  name     = var.rgname
  location = var.location
}