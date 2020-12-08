# Managed Service Identity

resource "azurerm_user_assigned_identity" "msi" {
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  name                = "${local.prefix}-msi"

}

#AAD POD IDENTITY
resource "azurerm_user_assigned_identity" "aad_pod" {
  location            = azurerm_kubernetes_cluster.aks.location
  resource_group_name = azurerm_kubernetes_cluster.aks.node_resource_group
  name                = "${local.prefix}-aad-pod"
  tags                = azurerm_resource_group.resource_group.tags
}