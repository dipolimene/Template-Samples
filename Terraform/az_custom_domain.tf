resource "azurerm_app_service_custom_hostname_binding" "example" {
  hostname            = "www.mywebsite.com"
  app_service_name    = var.appServiceName
  resource_group_name = azurerm_resource_group.resource_group.name
  depends_on          = [azurerm_template_deployment.scepman]
}