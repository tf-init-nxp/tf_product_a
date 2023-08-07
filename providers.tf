provider "azurerm" {
  # Configuration options
  skip_provider_registration = "true"
  features {}
}

terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">=2.7.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.65.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.1.0"
    }
  }
  required_version = ">= 0.13"
}
