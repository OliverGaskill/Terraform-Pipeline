terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "acme-app1-backend-rg"   # matches backend RG
    storage_account_name = "acmeapp1backendsa"      # matches backend Storage Account
    container_name       = "tfstate"                # container created above
    key                  = "terraform.tfstate"      # state file name
  }
}
