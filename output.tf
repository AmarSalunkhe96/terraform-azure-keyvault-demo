output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}
output "pub-ip" {
  value = azurerm_public_ip.pip.ip_address
}
output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}
output "subnet_name" {
  value = azurerm_subnet.subnet.name
}