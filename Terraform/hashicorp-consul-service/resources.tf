# Creates a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
}

resource "azurerm_template_deployment" "hcs" {
  count               = var.deployment_count
  name                = var.hcs_deployment
  resource_group_name = azurerm_resource_group.rg.name

  template_body = file("./templates/hcs/template.json")

  parameters = {

    initialConsulVersion = var.initialConsulVersion
    storageAccountName = var.storageAccountName
    blobContainerName = var.blobContainerName
    clusterMode = var.clusterMode
    clusterName = var.clusterName
    consulDataCenter = var.consulDataCenter
    numServers = var.numServers
    numServersDevelopment = var.numServersDevelopment
    automaticUpgrades = var.automaticUpgrades
    consulConnect = var.consulConnect
    externalEndpoint = var.externalEndpoint
    snapshotInterval = var.snapshotInterval
    snapshotRetention = var.snapshotRetention
    consulVnetCidr = var.consulVnetCidr
    location = var.location
    providerBaseURL = var.providerBaseURL
    email = var.email
  # federationToken = var.federationToken
    applicationResourceName = var.applicationResourceName
    managedResourceGroupId = var.managedResourceGroupId
    managedIdentity = var.managedIdentity

  }

  deployment_mode = "Incremental"
}