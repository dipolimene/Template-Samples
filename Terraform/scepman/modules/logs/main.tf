# Streaming Diagnostics Log on the App Service to Log Analytics Workspace

resource "azurerm_monitor_diagnostic_setting" "diag_log" {
    
      name                       = var.diagLogName
      target_resource_id         = var.tarResID
      log_analytics_workspace_id = var.lawID

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

    }