
provider "helm" {
  version = "1.2.2"
  kubernetes {
    host                   = azurerm_kubernetes_cluster.cluster.kube_config[0].host
    client_key             = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].client_key)
    client_certificate     = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].client_certificate)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].cluster_ca_certificate)
    load_config_file       = false
  }
}

resource "helm_release" "agic" {
 name        = "agic"
 namespace   = "agic"
 repository  = "https://appgwingress.blob.core.windows.net/ingress-azure-helm-package/"
 chart       = "application-gateway-kubernetes-ingress"

 depends_on = [azurerm_kubernetes_cluster.aks]

 values = [
    "${file("agic/helm-config.yaml")}"
  ]

 set{
     name  = "rbac.enabled"
     value = "true"
 }

 set {
    name  = "applicationGatewayName"
    value = azurerm_application_gateway.agw.name
  }

 set {
    name  = "resourceGroupName"
    value = azurerm_resource_group.resource_group.name
  }

 set {
    name  = "subscriptionId"
    value = "bb9687aa-6b97-47f1-bd9a-7f43b3b0f42d"
  }

 set {
    name  = "identityClientId"
    value = "true"
  }

 set {
    name  = "identityResourceId"
    value = "true"
  }

}
