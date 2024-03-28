resource "azurerm_public_ip" "portfolio-pip" {
  location            = var.location
  name                = var.portfolio_public_ip
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones = [1, 2, 3]
}