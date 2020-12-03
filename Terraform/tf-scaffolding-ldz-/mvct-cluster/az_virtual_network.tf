# Virtual Network

resource "azurerm_virtual_network" "vnet" {
  name                = "${local.prefix}-vnet"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  address_space       = [var.vnet_address]

}