# Variables

variable "vnet_address" {
  description = "The CIDR address of vnet, /8 address"
  type        = string
  default     = "15.0.0.0/8"
}

variable "subnet_aks_address" {
  description = "The CIDR address of aks subnet, /16 address to minimum allowed"
  type        = string
  default     = "15.0.0.0/16"
}

variable "subnet_app_gateway_address" {
  description = "The CIDR address of the application gateway subnet, /16 address to minimum allowed"
  type        = string
  default     = "15.1.0.0/16"
}

variable "location" {
  description = "The region"
  type        = string
  default     = "uksouth"
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

# HCS Variables #

variable "deployment_count" {
  type        = number
  description = "Number of template deployments"
  default     = 1
}

variable "initialConsulVersion"{
  type        = string
  default     = "v1.8.4"
} 

variable "storageAccountName"{
  type        = string
  default     = "halomvcthcsstorage"
} 

variable "blobContainerName"{
  type        = string
  default     = "halomvcthcsblob"
} 

variable "clusterMode"{
  type        = string
  default     = "PRODUCTION"
}

variable "clusterName"{
  type        = string
  default     = "halomvcthcs"
} 

variable "consulDataCenter"{
  type        = string
  default     = "dc1"
} 

variable "numServers"{
  type        = number
  default     = 3
} 

variable "numServersDevelopment"{
  type        = number
  default     = 1
}

variable "automaticUpgrades"{
  type        = string
  default     = "disabled"
} 

variable "consulConnect"{
  type        = string
  default     = "enabled"
} 

variable "externalEndpoint"{
  type        = string
  default     = "enabled"
} 

variable "snapshotInterval"{
  type        = string
  default     = "1d"
}

variable "snapshotRetention"{
  type        = string
  default     = "1m"
} 

variable "consulVnetCidr"{
  type        = string
  default     = "172.25.16.0/24"
} 

variable "providerBaseURL"{
  type        = string
  default     = "https://ama-api.hashicorp.cloud/consulama/2020-11-06"
}

variable "email"{
  type        = string
  default     = "aman.bindal@test-and-trace.nhs.uk"
} 

variable "federationToken"{
  type        = string
  default     = null
} 

variable "applicationResourceName"{
  type        = string
#  default     = "79117d058a6241999e0661aaea6125d3"
  default     = "halomvcthcs"
} 

variable "managedResourceGroupId"{
  type        = string
  default    = "/subscriptions/bb9687aa-6b97-47f1-bd9a-7f43b3b0f42d/resourceGroups/halo-mvct-hcs-mgr"
}

variable "managedIdentity"{
  default     = null
}

# HCS Variables #