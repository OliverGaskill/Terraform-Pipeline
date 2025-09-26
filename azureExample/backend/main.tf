# Use once for setting up a container with tf state
# Login using az or set sub id

terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.0.0"
    }
  }

  # Use local backend for bootstrap
  backend "local" {}
}

provider "azurerm" {
  features {}
}

variable "location" {
  default = "westeurope"
}

resource "azurerm_resource_group" "backend_rg" {
  name     = "acme-app1-backend-rg"
  location = var.location
}

resource "azurerm_storage_account" "backend_sa" {
  name                     = "acmeapp1backendsa"
  resource_group_name      = azurerm_resource_group.backend_rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.backend_sa.id
  container_access_type = "private"
}
