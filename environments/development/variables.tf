variable resource_group_name {
    type = string
    default = "terraform-portfolio-rg"
}


variable portfolio_managed_id {
    default = "portfolio-managed-id"
}

variable location {
    default = "eastus"    
}

variable portfolio_public_ip {
    type = string
    default = "portfolio-pip"
}

variable portfolio_virtual_network {
    type = string
    default = "portfolio-vnet"
}

variable portfolio_app_gateway_subnet {
    default = "ApplicationGatewaySubnet"
}

variable vnet_address_space {
    type = list(string)
    default = ["10.5.0.0/16"]
}

variable subnet_address_prefixes {
    type = list(string)
    default = ["10.5.0.0/24"]
}

variable app_gateway_name {
    default = "portfolio-agw"
}