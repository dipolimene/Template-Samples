# - Key Vault

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
#  name                      = "${local.prefix}-ekey-vault"
  name                       = "halomvctvault"
  location                   = azurerm_resource_group.resource_group.location
  resource_group_name        = azurerm_resource_group.resource_group.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled        = true
  purge_protection_enabled   = false
  sku_name                   = "standard"

    # network_acls {
    #   default_action = "Deny"
    #   bypass         = "AzureServices"
    # }

}

resource "azurerm_key_vault_access_policy" "builder" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  certificate_permissions = [
      "create",
      "delete",
      "deleteissuers",
      "get",
      "getissuers",
      "import",
      "list",
      "listissuers",
      "managecontacts",
      "manageissuers",
      "setissuers",
      "update",
    ]

    key_permissions = [
      "backup",
      "create",
      "decrypt",
      "delete",
      "encrypt",
      "get",
      "import",
      "list",
      "purge",
      "recover",
      "restore",
      "sign",
      "unwrapKey",
      "update",
      "verify",
      "wrapKey",
    ]

    secret_permissions = [
      "backup",
      "delete",
      "get",
      "list",
      "purge",
      "recover",
      "restore",
      "set",
    ]
}

resource "azurerm_key_vault_access_policy" "kv" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_user_assigned_identity.msi.principal_id

  secret_permissions = [
    "get",
    "list"
  ]
}

resource "azurerm_key_vault_certificate" "mvctsite" {
  name         = "mvctsite"
  key_vault_id = azurerm_key_vault.kv.id
  depends_on = [azurerm_key_vault_access_policy.builder, azurerm_key_vault_access_policy.kv]

  certificate_policy {
    issuer_parameters {
      name = "Self"
    }

    key_properties {
      exportable = true
      key_size   = 2048
      key_type   = "RSA"
      reuse_key  = true
    }

    lifetime_action {
      action {
        action_type = "AutoRenew"
      }

      trigger {
        days_before_expiry = 30
      }
    }

    secret_properties {
      content_type = "application/x-pkcs12"
    }

    x509_certificate_properties {
      # Server Authentication = 1.3.6.1.5.5.7.3.1
      # Client Authentication = 1.3.6.1.5.5.7.3.2
      extended_key_usage = ["1.3.6.1.5.5.7.3.1"]

      key_usage = [
        "cRLSign",
        "dataEncipherment",
        "digitalSignature",
        "keyAgreement",
        "keyCertSign",
        "keyEncipherment",
      ]

      subject_alternative_names {
        dns_names = ["mvctsite.com"]
      }

      subject            = "CN=mvctsite.com"
      validity_in_months = 12
    }
  }
}