# HCS Varaibles

variable "hcs_deployment" {
  type        = string
  description = "Deployment name"
  default     = "hcs_deployment"
}

variable "rg_name" {
  type        = string
  description = "The name of resource group"
    default     = "mrg-hcs"
}

variable "rg_location" {
  type        = string
  description = "Location of resource group"
  default     = "UK South"
}

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
  default     = "mrghcsaksstorage"
} 

variable "blobContainerName"{
  type        = string
  default     = "mrghcsaksblob"
} 

variable "clusterMode"{
  type        = string
  default     = "PRODUCTION"
}

variable "clusterName"{
  type        = string
  default     = "halohcs"
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

variable "location"{
  type        = string
  default     = "uksouth"
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
  default     = "79117d058a6241999e0661aaea6125d3"
} 

variable "managedResourceGroupId"{
  type        = string
  default    = "/subscriptions/bb9687aa-6b97-47f1-bd9a-7f43b3b0f42d/resourceGroups/mrg-hcs-aks-prod"
}

variable "managedIdentity"{
  default     = null
}