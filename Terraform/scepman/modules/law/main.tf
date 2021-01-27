# Creates Log Analytics Workspace for App Service Diagnostics Settings
resource "azurerm_log_analytics_workspace" "law" {
    name                = var.lawName
    resource_group_name = var.rgname
    location            = var.location
    sku                 = "PerGB2018"
    retention_in_days   = 30
}