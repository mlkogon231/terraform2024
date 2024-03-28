resource "azurerm_resource_group" "terraform_portfolio_rg" {
  name     = var.resource_group_name
  location = var.location
}