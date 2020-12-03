# Set the Provider
provider "azurerm" {

  version = "=2.20.0"

  subscription_id = "bb9687aa-6b97-47f1-bd9a-7f43b3b0f42d"
  client_id       = "c640a651-cf18-42b1-963d-ecf55ac11bcc"
  client_secret   = "d6_6PIpk3.QBGHQ94_rO.5nH08~4Pbj9Qd"
  tenant_id       = "9a4eeda5-b6e3-4dfd-b631-a97fba18e829"

  features {}

}


provider "helm" {

  version = "1.3.2"

  kubernetes {
    config_path  = "/path/to/kube_cluster.yaml"
  }
}


terraform {
    backend "azurerm" {}
}