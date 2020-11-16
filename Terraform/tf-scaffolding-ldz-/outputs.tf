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
  description = "RG name"
}

output "vnet-app-gw" {
  value = azurerm_virtual_network.vnet_app_gateway
  description = "Application Gateway VNET refrence"
}

output "subnet-app-gw" {
  value = azurerm_subnet.subnet_app_gateway
  description = "Application Gateway subnet reference"
}

output "subnet-app-gw-id" {
  value = azurerm_subnet.subnet_app_gateway.id
  description = "Application Gateway subnet ID "
}

output "vnet-aks" {
  value = azurerm_virtual_network.vnet_aks
  description = "AKS VNET refrence"
}

output "subnet-aks" {
  value = azurerm_subnet.subnet_aks
  description = "AKS subnet reference"
}

output "subnet-aks-id" {
  value = azurerm_subnet.subnet_aks.id
  description = "AKS subnet ID "
}

output "client_key" {
    value = azurerm_kubernetes_cluster.aks.kube_config.0.client_key
}

output "client_certificate" {
    value = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
}

output "cluster_ca_certificate" {
    value = azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate
}

output "cluster_username" {
    value = azurerm_kubernetes_cluster.aks.kube_config.0.username
}

output "cluster_password" {
    value = azurerm_kubernetes_cluster.aks.kube_config.0.password
}

output "kube_config" {
    value = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "host" {
    value = azurerm_kubernetes_cluster.aks.kube_config.0.host
}
