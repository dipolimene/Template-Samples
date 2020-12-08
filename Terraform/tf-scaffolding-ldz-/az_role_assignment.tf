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

#AAD POD IDENTITY
resource "azurerm_role_assignment" "aad_pod_rg" {
  scope                = azurerm_resource_group.resource_group.id
  role_definition_name = "Owner"
  principal_id         = azurerm_user_assigned_identity.aad_pod.principal_id
  depends_on           = [azurerm_kubernetes_cluster.aks]
}

#resource "azurerm_role_assignment" "aad_pod_agw" {
#  scope                = azurerm_application_gateway.agw.id
#  role_definition_name = "Contributor"
#  principal_id         = azurerm_user_assigned_identity.aad_pod.principal_id
#  depends_on           = [azurerm_kubernetes_cluster.aks]
#}

#KUBELET NODE IDENTITY
resource "azurerm_role_assignment" "kube_aad_noderg" {
#  scope                = "/subscriptions/12e78806-5110-4aac-ac0b-ec2ea653d93a/resourcegroups/MC_halo-mvct-rg_halo-mvct-aks_uksouth"
  scope                = azurerm_kubernetes_cluster.aks.node_resource_group
  role_definition_name = "Owner"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  depends_on           = [azurerm_kubernetes_cluster.aks]
}

#OMS IDENTITY
resource "azurerm_role_assignment" "oms_aad_noderg" {
#  scope                = "/subscriptions/12e78806-5110-4aac-ac0b-ec2ea653d93a/resourcegroups/MC_halo-mvct-rg_halo-mvct-aks_uksouth"
  scope                = azurerm_kubernetes_cluster.aks.node_resource_group
  role_definition_name = "Managed Identity Operator"
  principal_id         = azurerm_kubernetes_cluster.aks.addon_profile[0].oms_agent[0].oms_agent_identity[0].object_id
}