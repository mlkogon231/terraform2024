# since these variables are re-used - a locals block makes this more maintainable
locals {
  backend_address_pool_name      = "${var.app_gateway_name}-beap"
  frontend_port_name             = "${var.app_gateway_name}-feport"
  frontend_ip_configuration_name = "${var.app_gateway_name}-feip"
  http_setting_name              = "${var.app_gateway_name}-be-htst"
  listener_name                  = "${var.app_gateway_name}-httplstn"
  request_routing_rule_name      = "${var.app_gateway_name}-rqrt"
  redirect_configuration_name    = "${var.app_gateway_name}-rdrcfg"
}

resource "azurerm_application_gateway" "appGateway" {
  name                = var.app_gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  zones = [1, 2, 3]



  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = "/subscriptions/e4fd8776-b150-43e5-a25a-14702ab31b39/resourceGroups/terraform-portfolio-rg/providers/Microsoft.Network/virtualNetworks/portfolio-vnet/subnets/ApplicationGatewaySubnet"
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = "/subscriptions/e4fd8776-b150-43e5-a25a-14702ab31b39/resourceGroups/terraform-portfolio-rg/providers/Microsoft.Network/publicIPAddresses/portfolio-pip"
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }
  
  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/no"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }
}