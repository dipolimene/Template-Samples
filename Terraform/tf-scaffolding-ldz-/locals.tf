locals {

  prefix   = "halo-mvct"
  sku_name = "Standard_v2"
  sku_tier = "Standard_v2"
  capacity = 2

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
