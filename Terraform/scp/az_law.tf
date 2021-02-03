#Creates Application Insights and Log Analytics Work Space

resource "azurerm_log_analytics_workspace" "law" {
  name                = var.lawName
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  sku                 = "PerGB2018"
  retention_in_days   = 30
}