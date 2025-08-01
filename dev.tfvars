# Resource group values
rg-name = "my_lab_rg1"
rg-location = "East US"

# Backend Storage account values
stg-name = "demoastorage59"
account_tier-stg = "Standard"
account_replication_type-stg = "LRS"
access_tier-stg = "Hot"
network_access-stg = false
container_name = "backend1"

# Key Vault configuration values
akv_name = "azureakv36"
enabled_for_disk_encryption-akv1 = true
purge_protection_enabled-akv = true
soft_delete_retention_days-akv = 30
sku-akv = "standard"

# ADF configuration values
variablemyadf101aditya = "myadf101aditya"
