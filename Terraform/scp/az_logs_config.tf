# Enabling App Service Logs and Diagnostics Log on the App Service

resource "azurerm_monitor_diagnostic_setting" "diag_log" {
    
      name                        = "scepmandiaglog"
      target_resource_id          = lookup(azurerm_template_deployment.scepman.outputs, "appServiceID")
      log_analytics_workspace_id  = azurerm_log_analytics_workspace.law.id

      log {
        category = "AppServiceConsoleLogs"
    
        retention_policy {
          enabled = false
        }
      }

      log {
        category = "AppServiceHTTPLogs"
    
        retention_policy {
          enabled = false
        }
      }

      log {
        category = "AppServiceAntivirusScanAuditLogs"
    
        retention_policy {
          enabled = false
        }
      }

      log {
        category = "AppServiceAuditLogs"
    
        retention_policy {
          enabled = false
        }
      }

      log {
        category = "AppServiceFileAuditLogs"
    
        retention_policy {
          enabled = false
        }
      }

      log {
        category = "AppServiceAppLogs"
    
        retention_policy {
          enabled = false
        }
      }

      log {
        category = "AppServiceIPSecAuditLogs"
    
        retention_policy {
          enabled = false
        }
      }

      log {
        category = "AppServicePlatformLogs"
    
        retention_policy {
          enabled = false
        }
      }
    
      metric {
        category = "AllMetrics"
    
        retention_policy {
          enabled = false
        }
      }

    depends_on = [azurerm_template_deployment.scepman, azurerm_log_analytics_workspace.law]
    
}