variable "vnet_app_gateway_address" {
  description = "The CIDR address of the application gateway vnet"
  type        = string
  default     = "10.1.0.0/16"
}

variable "subnet_app_gateway_address" {
  description = "The CIDR address of the application gateway subnet, /27 address to minimum allowed"
  type        = string
  default     = "10.1.1.0/27"
}

variable "vnet_aks_address" {
  description = "The CIDR address of aks vnet"
  type        = string
  default     = "10.2.0.0/16"
}

variable "subnet_aks_address" {
  description = "The CIDR address of aks subnet, /22 address to minimum allowed"
  type        = string
  default     = "10.2.0.0/22"
}

variable "resource_group_name" {
  description = "The resource group name"
  type        = string
  default     = "halloween"
}

variable "location" {
  description = "The region"
  type        = string
  default     = "UK South"
}