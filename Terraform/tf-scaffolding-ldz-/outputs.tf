output "rg" {
  value = azurerm_resource_group.resource_group
  description = "RG reference"
}

output "rgname" {
  value = azurerm_resource_group.resource_group.name
  description = "RG name"
}

output "rglocation" {
  value = azurerm_resource_group.resource_group.location
  description = "Resource group region"
}

output "vnet" {
  value = azurerm_virtual_network.vnet
  description = "Virtual Network refrence"
}

output "subnet-aks" {
  value = azurerm_subnet.subnet_aks
  description = "AKS subnet reference"
}

output "subnet-aks-id" {
  value = azurerm_subnet.subnet_aks.id
  description = "AKS subnet ID "
}

output "subnet-app-gw" {
  value = azurerm_subnet.subnet_app_gateway
  description = "Application Gateway subnet reference"
}

output "subnet-app-gw-id" {
  value = azurerm_subnet.subnet_app_gateway.id
  description = "Application Gateway subnet ID "
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "mi_principal_id" {
  value = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}

output "mi_tenant_id" {
  value = azurerm_kubernetes_cluster.aks.identity[0].tenant_id
}

output "kubelet_client_id" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity[0].client_id
}

output "kubelet_object_id" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

output "kubelet_user_assigned_identity_id" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity[0].user_assigned_identity_id
}

output "client_key" {
  value     = azurerm_kubernetes_cluster.aks.kube_config[0].client_key
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
}

output "cluster_ca_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate
  sensitive = true
}

output "cluster_username" {
    value = azurerm_kubernetes_cluster.aks.kube_config[0].username
}

output "cluster_password" {
    value = azurerm_kubernetes_cluster.aks.kube_config[0].password
}

output "kube_config" {
    value = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "host" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].host
}

output "login_server" {
  value = azurerm_container_registry.acr.login_server
  description = "Azure Container Registry server login reference"
}

output "acr_id" {
  value = azurerm_container_registry.acr.id
    description = "Azure Container reference ID"
}

output "log_analytics" {
  value = azurerm_log_analytics_workspace.oms
  description = "Log Analytics Workspace reference"
}



