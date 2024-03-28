module "terraform_portfolio-resource-groups" {
  source = "../../modules/resource-groups"
  resource_group_name     = var.resource_group_name
  location                = var.location
}

module "user_assigned_managed_identities" {
  source = "../../modules/entra_id"
  resource_group_name = var.resource_group_name
  location = var.location
  portfolio_managed_id = var.portfolio_managed_id
}

module "public_ip" {
  source = "../../modules/pips"
  resource_group_name = var.resource_group_name
  location = var.location
  portfolio_public_ip = var.portfolio_public_ip
}

module "network" {
  source = "../../modules/network"
  resource_group_name = var.resource_group_name
  location = var.location 
  virtual_network_name = var.portfolio_virtual_network
  portfolio_app_gateway_subnet = var.portfolio_app_gateway_subnet
  vnet_address_space = var.vnet_address_space
  subnet_address_prefixes = var.subnet_address_prefixes
  
}

module "appgateway" {
  source = "../../modules/appgateway"
  resource_group_name = var.resource_group_name
  virtual_network_name = var.portfolio_virtual_network
  location = var.location 
  portfolio_managed_id = var.portfolio_managed_id
  app_gateway_name = var.app_gateway_name
}