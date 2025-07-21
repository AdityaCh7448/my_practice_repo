# Create Resource Group 
resource "azurerm_resource_group" "my_lab_rg1" {
  location = var.rg-location
  name = var.rg-name
}

# Create Storage account for Backend Configuration #

resource "azurerm_storage_account" "backend-storage" {
  name                     = var.stg-name
  resource_group_name      = azurerm_resource_group.my_lab_rg1.name
  location                 = azurerm_resource_group.my_lab_rg1.location
  account_tier             = var.account_tier-stg
  account_replication_type = var.account_replication_type-stg
  access_tier = var.access_tier-stg
  public_network_access_enabled = var.network_access-stg
}

resource "azurerm_storage_container" "backend-stg-container" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.backend-storage.id
}