variable "location" {
  type = string
  default = "Central India"
}
variable "resource_group_name" {
  type = string
  default = "rg-terraform-github-demo"
}
variable "vm_name" {
  type = string
  default = "vm-demo-01"
}
variable "vm_size" {
  type = string
  default = "Standard_B2s"
}
variable "environment" {
  type = string
  default = "dev"
}