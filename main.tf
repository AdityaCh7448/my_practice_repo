# Create Resource Group 
resource "azurerm_resource_group" "my_lab_rg1" {
  location = "eastus"
  name = "my-lab-rg1"  
}