resource "azurerm_virtual_network" "virtual_network_name" {
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "app_gateway_subnet" {
  depends_on = [ azurerm_virtual_network.virtual_network_name ]
  name                 = "ApplicationGatewaySubnet"
  address_prefixes     = var.subnet_address_prefixes
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  
}