terraform {
  backend "azurerm" {
    resource_group_name = "rg-terraform-github-demo"
    storage_account_name = "amarstrgterr"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }
}