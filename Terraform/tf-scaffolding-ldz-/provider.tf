#Set the Provider
provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x. 
  # If you are using version 1.x, the "features" block is not allowed.
  
  subscription_id = "b99f9c12-69c9-4de1-a738-80c58769a372"
  client_id       = "cd2df622-b890-4a5a-baeb-ec22f7f0630b"
  client_secret   = "l7~~pYGUax25_2RQn7zBkq1bl_.bluh7gT"
  tenant_id       = "186fd90f-50d1-4e88-8845-639ce0346a8c"

  features {}

}

terraform {
  backend "azurerm" {}
}

