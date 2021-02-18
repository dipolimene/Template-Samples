
resource "azurerm_traffic_manager_profile" "scepman_traffic_manager" {
  name                   = "tm-emtwenty"
  resource_group_name = azurerm_resource_group.resource_group.name
  traffic_routing_method = "Performance"
  depends_on = [azurerm_template_deployment.scepman, azurerm_template_deployment.scepman_clone_app]

  dns_config {
    relative_name = "tm-emtwenty"
    ttl           = 30
  }

  monitor_config {
    protocol                     = "https"
    port                         = 443
    path                         = "/"
    interval_in_seconds          = 10
    timeout_in_seconds           = 5
    tolerated_number_of_failures = 3
  }
}

resource "azurerm_traffic_manager_endpoint" "scepman_primary_region" {
  name                = "scepman-primary-region"
  resource_group_name = azurerm_resource_group.resource_group.name
  profile_name        = azurerm_traffic_manager_profile.scepman_traffic_manager.name
  type                = "azureEndpoints"
  target_resource_id  = lookup(azurerm_template_deployment.scepman.outputs, "appServiceID")
  endpoint_location   = var.location
}

resource "azurerm_traffic_manager_endpoint" "scepman_secondary_region" {
  name                = "scepman-secondary-region"
  resource_group_name = azurerm_resource_group.resource_group.name
  profile_name        = azurerm_traffic_manager_profile.scepman_traffic_manager.name
  type                = "azureEndpoints"
  target_resource_id  = lookup(azurerm_template_deployment.scepman_clone_app.outputs, "cloneappServiceID")
  endpoint_location   = var.clonelocation
}