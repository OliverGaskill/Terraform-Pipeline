# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = lower("${var.company}-${var.project}-${var.environment}-rg")
  location = var.location
}

# Storage Account
resource "azurerm_storage_account" "storage-acc" {
  name                     = "storrage-acc"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Virtual Network
resource "azurerm_virtual_network" "v-net" {
  name                = lower("${var.company}-${var.project}-${var.environment}-vnet")
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  address_space       = ["10.0.0.0/24"]
}

# Storage Container for Terraform state
resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.storage-acc.id
  container_access_type = "private"
    }

resource "azurerm_network_security_group" "nsg" {
  name                  = "nsg"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location

  security_rule {
    name                       = "security-rules"
    priority                   = "100"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
