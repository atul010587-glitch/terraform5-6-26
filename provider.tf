terraform {
  required_providers {
    azurerm = {
        version = "4.73.0"
        source = "hashicorp/azurerm"
    }
  }
}
provider "azurerm" {
    features {}
    }