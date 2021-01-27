output "rgname" {
  value = azurerm_resource_group.resource_group.name
  description = "Resource Group Name"
}

output "location" {
  value = azurerm_resource_group.resource_group.location
  description = "Resource Group Location"
}