
resource "azurerm_virtual_network" "vnet_aks" {
  name                = "${local.prefix}-vnet-aks"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  address_space       = [var.vnet_aks_address]

  tags = azurerm_resource_group.resource_group.tags
}

resource "azurerm_virtual_network" "vnet_app_gateway" {
  name                = "${local.prefix}-vnet-app-gw"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  address_space       = [var.vnet_app_gateway_address]

  tags = azurerm_resource_group.resource_group.tags
}