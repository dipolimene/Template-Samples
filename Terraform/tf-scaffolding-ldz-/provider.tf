#Set the Provider
provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x. 
  # If you are using version 1.x, the "features" block is not allowed.


  features {}

}

provider "helm" {
  version = "1.3.2"

  kubernetes {
    config_path = "/path/to/kube_cluster.yaml"
  }
}

#terraform {
#  backend "azurerm" {}
#}

