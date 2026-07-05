output "vm_name" {
  value = module.compute.vm_name
}

output "pub-ip" {
  value = module.compute.public_ip
}

output "virtual_network_name" {
  value = module.network.vnet_name
}

output "subnet_names" {
  value = module.network.subnet_names
}