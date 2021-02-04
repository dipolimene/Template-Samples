data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                       = "kv-keyvault"
  resource_group_name        = azurerm_resource_group.resource_group.name
  location                   = azurerm_resource_group.resource_group.location
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "create",
      "get",
    ]

    secret_permissions = [
      "set",
      "get",
      "delete",
      "purge",
      "recover"
    ]
  }
}

resource "random_password" "scepman_random" {
  length  = 30
  special = true
}

resource "azurerm_key_vault_secret" "appID" {
  name         = "appID"
  value        = random_password.scepman_random.result
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "appSecretID" {
  name         = "appSecretID"
  value        = random_password.scepman_random.result
  key_vault_id = azurerm_key_vault.key_vault.id
}