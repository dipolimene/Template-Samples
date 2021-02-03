variable "rgname" {
  type        = string
  default     = "rg-scepmannhpno"
}

variable "location" {
  type        = string
  default     = "uksouth"
}

variable "OrgName"{
  type        = string
  default     = "NHP"
}  

variable "appRegistrationGuid"{
  type        = string
  default     = "013c514e-3324-4d77-b9a7-971e2156c6eb"
}

variable "appRegistrationKey"{
  type        = string
  default     = "WAhCk9~_FyML_Y3gwvyt6hV27ehKhT~-87"
}

variable "keyVaultName"{
  type        = string
  default     = "kv-scepmannhpno"
}

variable "appServicePlanName"{
  type        = string
  default     = "plan-scepmannhpno"
} 

variable "appServiceName"{
  type        = string
  default     = "app-scepmannhpno"
} 

variable "lawName" {
  type        = string
  default     = "law-scepmannhpno"
}