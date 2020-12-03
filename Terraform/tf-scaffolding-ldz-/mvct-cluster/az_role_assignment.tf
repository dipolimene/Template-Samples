#Role Assignment

resource "azurerm_role_assignment" "oms_aad_aks" {
  scope                = azurerm_kubernetes_cluster.aks.id
  role_definition_name = "Monitoring Metrics Publisher"
  principal_id         = azurerm_kubernetes_cluster.aks.addon_profile[0].oms_agent[0].oms_agent_identity[0].object_id
}
resource "azurerm_role_assignment" "aks_aad_net" {
  scope                = azurerm_subnet.subnet_aks.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  depends_on           = [azurerm_virtual_network.vnet]
}
resource "azurerm_role_assignment" "kube_aad_acr" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

resource "azurerm_role_assignment" "aks_aad_msi" {
  scope                = azurerm_user_assigned_identity.msi.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  depends_on           = [azurerm_user_assigned_identity.msi]
}

resource "azurerm_role_assignment" "msi_aad_agw" {
  scope                = azurerm_application_gateway.agw.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.msi.principal_id
  depends_on           = [azurerm_user_assigned_identity.msi, azurerm_application_gateway.agw]
}

resource "azurerm_role_assignment" "msi_aad_rg" {
  scope                = azurerm_resource_group.resource_group.id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.msi.principal_id
  depends_on           = [azurerm_user_assigned_identity.msi, azurerm_application_gateway.agw]
}