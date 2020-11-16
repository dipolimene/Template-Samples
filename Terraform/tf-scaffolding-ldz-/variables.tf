variable "vnet_app_gateway_address" {
  description = "The CIDR address of the application gateway vnet"
  type        = string
}

variable "subnet_app_gateway_address" {
  description = "The CIDR address of the application gateway subnet, /27 address to minimum allowed"
  type        = string
}

variable "vnet_aks_address" {
  description = "The CIDR address of aks vnet"
  type        = string
}

variable "subnet_aks_address" {
  description = "The CIDR address of aks subnet, /27 address to minimum allowed"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name"
  type        = string
}

variable "location" {
  description = "The region"
  type        = string
}