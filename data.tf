data "azurerm_resource_group" "rg" {
  name = "rg-terraform-github-demo"
}
data "azurerm_key_vault" "kv" {
  name                = "sectets-keyvault-97"
  resource_group_name = data.azurerm_resource_group.rg.name
}
data "azurerm_key_vault_secret" "vm_username" {
  name         = "vm-admin-username"
  key_vault_id = data.azurerm_key_vault.kv.id
}
data "azurerm_key_vault_secret" "vm_password" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.kv.id
}