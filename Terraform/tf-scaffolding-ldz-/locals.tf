locals {

  prefix   = "halo-mvct"
 # rg_name  = "demo-rg" #An existing Resource Group for the Application Gateway 
  sku_name = "Standard_Small"
  sku_tier = "Standard"
  capacity = 2
 # subnet_id = "/subscriptions/bb9687aa-6b97-47f1-bd9a-7f43b3b0f42d/resourceGroups/demo-rg/providers/Microsoft.Network/virtualNetworks/vnetrg/subnets/appgwsubnet" #Fill Here a dedicated subnet if for the Application Gateway

  appname = "halo-mvct-site"
  backend_address_pool = {
    name  = "${local.appname}-pool"
    fqdns = ["mvctsite.azurewebsites.net"]
  }
  frontend_port_name             = "${local.appname}-feport"
  frontend_ip_configuration_name = "${local.appname}-feip"
  http_setting_name              = "${local.appname}-be-htst"
  listener_name                  = "${local.appname}-httplstn"
  request_routing_rule_name      = "${local.appname}-rqrt"
  redirect_configuration_name    = "${local.appname}-rdrcfg"

  diag_appgw_logs = [
    "ApplicationGatewayAccessLog",
    "ApplicationGatewayPerformanceLog",
    "ApplicationGatewayFirewallLog",
  ]
  diag_appgw_metrics = [
    "AllMetrics",
  ]

}