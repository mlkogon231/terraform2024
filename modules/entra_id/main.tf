resource "azurerm_user_assigned_identity" "portfolio_managed_id" {
  location            = var.location
  name                = var.portfolio_managed_id
  resource_group_name = var.resource_group_name
}