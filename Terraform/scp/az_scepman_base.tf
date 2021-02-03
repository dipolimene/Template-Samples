# Scepman

resource "azurerm_template_deployment" "scepman" {
  name                = "deployment-scepman-nhp"
  resource_group_name = azurerm_resource_group.resource_group.name

  template_body = file("./templates/scepman/template.json")

  parameters = {

    OrgName             = var.OrgName
    appRegistrationGuid = var.appRegistrationGuid
    appRegistrationKey  = var.appRegistrationKey
    keyVaultName        = var.keyVaultName
    appServicePlanName  = var.appServicePlanName
    appServiceName      = var.appServiceName

  }

  deployment_mode = "Incremental"

}