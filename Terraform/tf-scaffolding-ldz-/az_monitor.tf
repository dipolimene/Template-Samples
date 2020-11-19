# Monitor (Log Analytics Workspace)

resource "azurerm_log_analytics_workspace" "oms" {
  name                = "${local.prefix}-container-log-analytics"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_log_analytics_solution" "solution" {
    solution_name         = "${local.prefix}-container-solution-insights"
    location              = azurerm_resource_group.resource_group.location
    resource_group_name   = azurerm_resource_group.resource_group.name
    workspace_resource_id = azurerm_log_analytics_workspace.oms.id
    workspace_name        = azurerm_log_analytics_workspace.oms.name

    plan {
        publisher = "Microsoft"
        product   = "OMSGallery/ContainerInsights"
    }
}