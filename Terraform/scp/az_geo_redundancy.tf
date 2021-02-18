# Scepman Geo Redundancy

resource "azurerm_template_deployment" "scepman_clone_app" {
  name                = "deployment-clone-app"
  resource_group_name = azurerm_resource_group.resource_group.name

  template_body = file("./templates/cloneapp/template.json")
  depends_on = [azurerm_template_deployment.scepman, azurerm_monitor_diagnostic_setting.diag_log]
  parameters = {

    name                    = var.cloneappServiceName
    hostingPlanName         = var.cloneappServicePlanName
    hostingEnvironment      = var.clonehostingEnvironment
    location                = var.clonelocation
    sku                     = var.clonesku
    skuCode                 = var.cloneskucode
    workerSize              = var.cloneworkersize
    serverFarmResourceGroup = var.rgname
    subscriptionId          = lookup(azurerm_template_deployment.scepman.outputs, "subscriptionID")
    SourceWebAppId          = lookup(azurerm_template_deployment.scepman.outputs, "appServiceID")
    SourceWebAppLocation    = var.location

  }

  deployment_mode = "Incremental"

}