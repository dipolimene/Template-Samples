variable "rgname" {
  type        = string
  default     = "rg-wexsw"
}

variable "location" {
  type        = string
  default     = "West Europe"
}

variable "OrgName"{
  type        = string
  default     = "wexsw"
}  

variable "appRegistrationGuid"{
  type        = string
  default     = ""
}

variable "appRegistrationKey"{
  type        = string
  default     = ""
}

variable "keyVaultName"{
  type        = string
  default     = "kv-wexsw"
}

variable "appServicePlanName"{
  type        = string
  default     = "plan-wexsw"
} 

variable "appServiceName"{
  type        = string
  default     = "app-wexsw"
} 

variable "lawName" {
  type        = string
  default     = "law-wexsw"
}

#clone variables

variable "cloneappServiceName" {
  type        = string
  default     = "app-wsxew"
}

variable "cloneappServicePlanName"{
  type        = string
  default     = "plan-wsxew"
}

variable "clonehostingEnvironment" {
  type        = string
  default     = ""
}

variable "clonelocation" {
  type        = string
  default     = "West US"
}

variable "clonesku" {
  type        = string
  default     = "Standard"
}

variable "cloneskucode"{
  type        = string
  default     = "S1"
}

variable "cloneworkersize" {
  type        = string
  default     = "0"
}