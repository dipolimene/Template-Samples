# - Application Gateway

resource "azurerm_application_gateway" "agw" {
  name                = "${local.prefix}-app-gw"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  enable_http2        = true

  sku {
    name      = local.sku_name
    tier      = local.sku_tier
    capacity  = local.capacity
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.msi.id]
  }

  gateway_ip_configuration {
    name      = "${local.prefix}-app-gw-ip-configuration"
    subnet_id = azurerm_subnet.subnet_app_gateway.id
  }

  frontend_ip_configuration {
    name                 = "${local.frontend_ip_configuration_name}-public"
    public_ip_address_id = azurerm_public_ip.pip.id
  }

  frontend_port {
    name = "${local.frontend_port_name}-80"
    port = 80
  }

  frontend_port {
    name = "${local.frontend_port_name}-443"
    port = 443
  }

  backend_address_pool {
    name  = local.backend_address_pool.name
  }

  ssl_certificate {
    name                = azurerm_key_vault_certificate.mvctsite.name
    key_vault_secret_id = azurerm_key_vault_certificate.mvctsite.secret_id
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 1
  }

  http_listener {
    name                           = "${local.listener_name}-http"
    frontend_ip_configuration_name = "${local.frontend_ip_configuration_name}-public"
    frontend_port_name             = "${local.frontend_port_name}-80"
    protocol                       = "Http"
  }

  http_listener {
    name                           = "${local.listener_name}-https"
    frontend_ip_configuration_name = "${local.frontend_ip_configuration_name}-public"
    frontend_port_name             = "${local.frontend_port_name}-443"
    protocol                       = "Https"
    ssl_certificate_name           = azurerm_key_vault_certificate.mvctsite.name
  }

  request_routing_rule {
    name                       = "${local.request_routing_rule_name}-https"
    rule_type                  = "Basic"
    http_listener_name         = "${local.listener_name}-https"
    backend_address_pool_name  = local.backend_address_pool.name
    backend_http_settings_name = local.http_setting_name
  }

  redirect_configuration {
    name                 = local.redirect_configuration_name
    redirect_type        = "Permanent"
    include_path         = true
    include_query_string = true
    target_listener_name = "${local.listener_name}-https"
  }

  request_routing_rule {
    name                        = "${local.request_routing_rule_name}-http"
    rule_type                   = "Basic"
    http_listener_name          = "${local.listener_name}-http"
    redirect_configuration_name = local.redirect_configuration_name
  }

  // Ignore most changes as they will be managed manually
  lifecycle {
    ignore_changes = [
      backend_address_pool,
      backend_http_settings,
      frontend_port,
      http_listener,
      probe,
      request_routing_rule,
      url_path_map,
      ssl_certificate,
      redirect_configuration,
      autoscale_configuration
    ]
  }
}