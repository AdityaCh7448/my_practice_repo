# Create Resource Group 
resource "azurerm_resource_group" "my_lab_rg1" {
  location = var.rg-location
  name = var.rg-name
}

# Create Storage account for Backend Configuration #

resource "azurerm_storage_account" "demoastorage" {
  name                     = var.stg-name
  resource_group_name      = azurerm_resource_group.my_lab_rg1.name
  location                 = azurerm_resource_group.my_lab_rg1.location
  account_tier             = var.account_tier-stg
  account_replication_type = var.account_replication_type-stg
  access_tier = var.access_tier-stg
  public_network_access_enabled = var.network_access-stg
}

resource "azurerm_storage_container" "demoastorage-stg-container" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.demoastorage.id
}

# Create Azure KeyVault #
resource "azurerm_key_vault" "azureakv36" {
  name                        = var.akv_name
  location                    = azurerm_resource_group.my_lab_rg1.location
  resource_group_name         = azurerm_resource_group.my_lab_rg1.name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption-akv1
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days-akv
  purge_protection_enabled    = var.purge_protection_enabled-akv
  sku_name = var.sku-akv
}
resource "azurerm_key_vault_access_policy" "keyvault-access-policy" {
  key_vault_id = azurerm_key_vault.azureakv36.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions = [
    "Get",
  ]

  secret_permissions = [
    "Get",
  ]
}

# Create azure data factory #
resource "azurerm_data_factory" "myadf101aditya" {
  name                = var.variablemyadf101aditya
  location            = azurerm_resource_group.my_lab_rg1.location
  resource_group_name = azurerm_resource_group.my_lab_rg1.name
  managed_virtual_network_enabled = false
  public_network_enabled = false
}