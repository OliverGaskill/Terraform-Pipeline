terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.46.0"
    }
  }
}

provider "azurerm" {
  features {}
   resource_provider_registrations = "none"
  subscription_id = "6223c7f1-94fb-40da-b0bb-cb7c25d3a212"
}