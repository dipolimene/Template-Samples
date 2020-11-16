# - Managed Service Identity

resource "azurerm_user_assigned_identity" "msi" {
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  name                = "${local.prefix}-msi"
  tags                = azurerm_resource_group.resource_group.tags
}