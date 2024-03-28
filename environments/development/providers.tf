terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0"  
    }
  }
  required_version = ">= 0.13"
}

# This block goes outside of the required_providers block!
provider "azurerm" {
  features {}  # Add this block
}
