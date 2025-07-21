# Resource group variables
variable "rg-name" {
  type = string
  description = "This is rg name"
}

variable "rg-location" {
  type = string
  description = "This is rg location"
}
# Backend storage account variables
variable "stg-name" {
  type = string
  description = "This is storage account name"
}

variable "account_tier-stg" {
  type = string
  description = "This is account tier for stg account"
}

variable "account_replication_type-stg" {
  type = string
  description = "This is account replication type"
}

variable "access_tier-stg" {
  type = string
  description = "This is access tier for stg"
}

variable "network_access-stg" {
  type = bool
  description = "This is public network access"
}

 # Backend storage account container variables
variable "container_name" {
  type = string
  description = "This is container name"
}


