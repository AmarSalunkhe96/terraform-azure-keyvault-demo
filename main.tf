resource "azurerm_virtual_network" "vnet" {
  name = "vnet-demo"
  resource_group_name = data.azurerm_resource_group.rg.name
  location = var.location
  address_space = ["10.0.0.0/16"]
  tags = {
    Environment = var.environment
  }
}
resource "azurerm_subnet" "subnet" {
  name = "subnet-demo"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["10.0.1.0/24"]
  resource_group_name = data.azurerm_resource_group.rg.name
}
resource "azurerm_network_security_group" "nsg" {
  name = "nsg-demo"
  resource_group_name = data.azurerm_resource_group.rg.name
  location = var.location

security_rule {
    name                       = "Allow-SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    Environment = var.environment
  }
}
resource "azurerm_subnet_network_security_group_association" "subnet_nsg" {
  subnet_id = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
resource "azurerm_public_ip" "pip" {
  name = "vm-pip"
  resource_group_name = data.azurerm_resource_group.rg.name
  location = var.location
  allocation_method = "Static"
  sku = "Standard"
  tags = {
    Environment = var.environment
  }
}
resource "azurerm_network_interface" "nic" {
  name = "nic"
  location = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ip_configuration {
    name = "internal"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip.id
    subnet_id = azurerm_subnet.subnet.id
  }
  tags = {
    Environment = var.environment
  }
}
resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  size                = var.vm_size

  admin_username = data.azurerm_key_vault_secret.vm_username.value
  admin_password = data.azurerm_key_vault_secret.vm_password.value

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  computer_name = "ubuntu-vm"

  tags = {
    Environment = var.environment
  }
}