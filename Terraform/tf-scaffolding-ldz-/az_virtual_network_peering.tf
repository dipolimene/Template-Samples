resource "azurerm_virtual_network_peering" "peer_aks_appgw" {
  name                      = "${local.prefix}-peer-aks-appgw"
  resource_group_name       = azurerm_resource_group.resource_group.name
  virtual_network_name      = azurerm_virtual_network.vnet_aks.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_app_gateway.id
}

resource "azurerm_virtual_network_peering" "peer_appgw_aks" {
  name                      = "${local.prefix}-peer-appgw-aks"
  resource_group_name       = azurerm_resource_group.resource_group.name
  virtual_network_name      = azurerm_virtual_network.vnet_app_gateway.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_aks.id
}