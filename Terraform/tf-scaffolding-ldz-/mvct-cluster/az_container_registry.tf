# Azure Container Registry 

resource "azurerm_container_registry" "acr" {
  name                      = local.acr_name
  location                  = azurerm_resource_group.resource_group.location
  resource_group_name       = azurerm_resource_group.resource_group.name
  sku                       = "Standard"
  admin_enabled             = false
}