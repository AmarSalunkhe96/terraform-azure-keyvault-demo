variable "location" {
  type    = string
  default = "Central India"
}
variable "resource_group_name" {
  type    = string
  default = "rg-terraform-github-demo"
}
variable "vm_name" {
  type    = string
  default = "vm-demo-01"
}
variable "vm_size" {
  type    = string
  default = "Standard_D2s_v3"
}
variable "environment" {
  type    = string
  default = "dev"
}
variable "vnet_name" {
  type    = string
  default = "vnet-demo"
}
variable "vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}
variable "subnets" {
  description = "Subnet configuration"

  type = map(object({
    address_prefixes = list(string)
  }))
}