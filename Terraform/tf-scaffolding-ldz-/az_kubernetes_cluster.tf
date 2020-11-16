# AKS Cluster

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${local.prefix}-aks"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  dns_prefix          = "${local.prefix}-aks"

  default_node_pool {
    name                = "default"
    node_count          = 2
    vm_size             = "Standard_D2_v2"
    type                = "VirtualMachineScaleSets"
    availability_zones  = ["1", "2"]
    enable_auto_scaling = true
    min_count           = 2
    max_count           = 4
    vnet_subnet_id      = azurerm_subnet.subnet_aks.id
  }

#  identity {
#    type = "SystemAssigned"
#  }

#  role_based_access_control {
#    azure_active_directory {
#      client_app_id     = var.client_app_id
#      server_app_id     = var.server_app_id
#      server_app_secret = var.server_app_secret
#      tenant_id         = var.tenant_id
#    }
#    enabled = true
#  }

  service_principal {
    client_id       = "cd2df622-b890-4a5a-baeb-ec22f7f0630b"
    client_secret   = "l7~~pYGUax25_2RQn7zBkq1bl_.bluh7gT"
    }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
    network_policy    = "calico"
  }

  tags                = azurerm_resource_group.resource_group.tags
}
