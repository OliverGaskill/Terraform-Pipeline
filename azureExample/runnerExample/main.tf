resource "azurerm_resource_group" "rg" {
  name     = lower("${var.company}-${var.project}-${var.environment}-rg")
  location = var.location
}


resource "azurerm_virtual_network" "vnet" {
  name                = lower("${var.company}-${var.project}-${var.environment}-vnet")
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  address_space       = ["10.0.0.0/28"]
}

resource "azurerm_network_security_group" "nsg" {
  name                = lower("${var.company}-${var.project}-${var.environment}-nsg")
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  security_rule {
    name                       = "allow-all-tcp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}