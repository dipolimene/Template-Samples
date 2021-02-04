output "scp" {
  value = azurerm_template_deployment.scepman
  description = "Scepman reference"
}

output "scp_appService_Id" {
  value = lookup(azurerm_template_deployment.scepman.outputs, "appServiceID")
  description = "Scepman App Service ID"
}

output "scp_appServicePlan_Id" {
  value = lookup(azurerm_template_deployment.scepman.outputs, "appServicePlanID")
  description = "Scepman App Service Plan ID"
}

output "appID" {
  value = azurerm_key_vault_secret.appID
}

output "secretID" {
  value = azurerm_key_vault_secret.appSecretID
}