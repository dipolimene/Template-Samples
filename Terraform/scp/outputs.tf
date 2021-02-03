output "scp" {
  value = azurerm_template_deployment.scepman
  description = "Scepman reference"
}

output "scp_appService_Id" {
  value = lookup(azurerm_template_deployment.scepman.outputs, "appServiceID")
  description = "Scepman App Service ID"
}