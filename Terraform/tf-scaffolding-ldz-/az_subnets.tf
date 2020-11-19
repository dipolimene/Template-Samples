# Subnets  
  
  resource "azurerm_subnet" "subnet_aks" {
   name                 = "${local.prefix}-subnet-aks"
   resource_group_name  = azurerm_resource_group.resource_group.name
   virtual_network_name = azurerm_virtual_network.vnet.name
   address_prefixes     = [var.subnet_aks_address]

  }

  
  resource "azurerm_subnet" "subnet_app_gateway" {
   name              = "${local.prefix}-subnet-app-gateway"
   resource_group_name = azurerm_resource_group.resource_group.name
   virtual_network_name = azurerm_virtual_network.vnet.name
   address_prefixes     = [var.subnet_app_gateway_address]

  }