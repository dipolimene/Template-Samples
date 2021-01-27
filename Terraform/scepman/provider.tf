# Set the Provider
provider "azurerm" {

  features {}

  subscription_id = "b99f9c12-69c9-4de1-a738-80c58769a372"
  client_id       = "013c514e-3324-4d77-b9a7-971e2156c6eb"
  client_secret   = "WAhCk9~_FyML_Y3gwvyt6hV27ehKhT~-87"
  tenant_id       = "186fd90f-50d1-4e88-8845-639ce0346a8c"

}

provider "azuread" {
  client_id       = "013c514e-3324-4d77-b9a7-971e2156c6eb"
  client_secret   = "WAhCk9~_FyML_Y3gwvyt6hV27ehKhT~-87"
  tenant_id       = "186fd90f-50d1-4e88-8845-639ce0346a8c"
}

#terraform {
#    backend "azurerm" {}
#}
