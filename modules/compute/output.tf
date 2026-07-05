output "public_ip" {
  value = azurerm_public_ip.pip.ip_address
}
output "public_ip_id" {
  value = azurerm_public_ip.pip.id
}
output "nic_id" {
  value = azurerm_network_interface.nic.id
}
output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}
output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}