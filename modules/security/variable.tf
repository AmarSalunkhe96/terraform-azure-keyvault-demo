variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "common_tags" {
  type        = map(string)
}

variable "subnet_id" {
  description = "Subnet ID where NSG will be associated"
  type        = string
}

variable "nsg_rules" {
  description = "NSG security rules"

  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}