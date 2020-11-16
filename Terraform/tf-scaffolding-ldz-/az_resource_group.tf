
resource "azurerm_resource_group" "resource_group" {
#  name     = "${local.prefix}-rg"
  name     = var.resource_group_name
  location = var.location
}


