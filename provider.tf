# Terraform Settings Block #
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
  
  # Terraform State Storage to Azure Storage Container
  backend "azurerm" {
    resource_group_name   = "backend-stg-rg"
    storage_account_name  = "stgbackend12"
    container_name        = "tfstatefile"
    key                   = "terraform.tfstate"
  } 
}

# Provider Block #
provider "azurerm" {
  features {}
  subscription_id = "a30f9ad7-95af-4cd9-8758-9a175871e644"
}

