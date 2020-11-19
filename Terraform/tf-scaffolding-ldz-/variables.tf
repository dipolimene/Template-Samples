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

variable "location" {
  description = "The region"
  type        = string
  default     = "UK South"
}

variable "aks_service_cidr" {
  description = "CIDR notation IP range from which to assign service cluster IPs"
  default     = "10.0.0.0/16"
}

variable "aks_dns_service_ip" {
  description = "DNS server IP address"
  default     = "10.0.0.10"
}

variable "aks_docker_bridge_cidr" {
  description = "CIDR notation IP for Docker bridge."
  default     = "172.17.0.1/16"
}
