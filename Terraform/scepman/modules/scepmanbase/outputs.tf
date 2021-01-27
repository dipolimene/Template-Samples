output "scp" {
  value = azurerm_template_deployment.scepman
  description = "Scepman reference"
}

output "scp_appServiceName" {
  value = azurerm_template_deployment.scepman.parameters.appServiceName
  description = "Scepman reference"
}