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

output "subscriptionID" {
  value = lookup(azurerm_template_deployment.scepman.outputs, "subscriptionID")
  description = "SubscriptionID"
}

output "mainapphostname" {
  value = lookup(azurerm_template_deployment.scepman.outputs, "mainapphostname")
  description = "mainapphostname"
}

output "cloneapphostname" {
  value = lookup(azurerm_template_deployment.scepman_clone_app.outputs, "cloneapphostname")
  description = "cloneapphostname"
}

output "cloneappServiceID" {
  value = lookup(azurerm_template_deployment.scepman_clone_app.outputs, "cloneappServiceID")
  description = "cloneappServiceID"
}