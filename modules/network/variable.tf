variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "common_tags" {
  description = "Common Tags"

  type = map(string)
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "subnets" {
  description = "Multiple subnet configuration"

  type = map(object({
    address_prefixes = list(string)
  }))
}
