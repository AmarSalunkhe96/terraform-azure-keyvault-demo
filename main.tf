module "network" {
  source = "./modules/network"

  resource_group_name = data.azurerm_resource_group.rg.name

  location = var.location

  common_tags = local.common_tags

  vnet_name = var.vnet_name

  vnet_address_space = var.vnet_address_space

  subnets = var.subnets
}
module "security" {
  source              = "./modules/security"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  common_tags         = local.common_tags
  subnet_id           = module.network.subnet_ids["web"]

  nsg_rules = [
    {
      name                       = "Allow-SSH"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "Allow-HTTP"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "Allow-HTTPS"
      priority                   = 120
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}

module "compute" {
  source              = "./modules/compute"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  common_tags         = local.common_tags
  subnet_id           = module.network.subnet_ids["web"]
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  admin_username      = data.azurerm_key_vault_secret.vm_username.value
  admin_password      = data.azurerm_key_vault_secret.vm_password.value
}

