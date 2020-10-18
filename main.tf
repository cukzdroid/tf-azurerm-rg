provider "azurerm" {
  version = ">=1.29.0"
  features {}
}

resource "azurerm_resource_group" "cukzrg" {
  name     = "cukzrg"
  location = "Southeast Asia"
    tags = {
        environment = "cukz dev"
    }
}

resource "azurerm_virtual_network" "cukzrg" {
  name                = "cukzvmnet"
  address_space       = ["10.54.55.0/24"]
  location            = azurerm_resource_group.cukzrg.location
  resource_group_name = azurerm_resource_group.cukzrg.name
    tags = {
        environment = "cukz dev"
    }
}

resource "azurerm_subnet" "cukzrg" {
  name                 = "cukzsnet01"
  resource_group_name  = azurerm_resource_group.cukzrg.name
  virtual_network_name = azurerm_virtual_network.cukzrg.name
  address_prefixes     = ["10.54.55.0/27"]
  enforce_private_link_endpoint_network_policies = true
}
