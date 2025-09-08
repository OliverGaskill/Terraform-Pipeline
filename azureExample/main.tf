# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = lower("${var.company}-${var.project}-${var.environment}-rg")
  location = var.location
}

# Storage Account
resource "azurerm_storage_account" "storage-acc" {
  name                     = lower("${var.company}-${var.project}-${var.environment}sa")
  resource_group_name      = azurerm_resource_group.main.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Virtual Network
resource "azurerm_virtual_network" "v-net" {
  name                = lower("${var.company}-${var.project}-${var.environment}-vnet")
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

# Resource Group for backend
resource "azurerm_resource_group" "rg-backend" {
  name     = lower("${var.company}-${var.project}-backend-rg")
  location = var.location
}

# Storage Account for backend
resource "azurerm_storage_account" "sa-backend" {
  name                     = lower("${var.company}${var.project}backendsa")
  resource_group_name      = azurerm_resource_group.backend.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Storage Container for Terraform state
resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.backend.name
  container_access_type = "private"
}