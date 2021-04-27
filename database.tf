
resource "azurerm_network_interface" "sqldb1-win-nic1" {
  name                = "sqldb1-win-nic1"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.tier2-subnet.id
    private_ip_address_allocation = "Dynamic"
    
  }
}

resource "azurerm_windows_virtual_machine" "sqldb1-win" {
  name                            = "sqldb1-win"
  location                        = var.location
  resource_group_name             = azurerm_resource_group.rg-main.name
  size                            = var.db_compute_size
  admin_username                  = var.win_admin_name
  admin_password                  = var.win_admin_pass
  network_interface_ids           = [
              azurerm_network_interface.sqldb1-win-nic1.id,
            ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftSQLServer"
    offer     = var.db_offer
    sku       = var.db_sku
    version   = "latest"
  }
}

resource "azurerm_mssql_virtual_machine" "sqldb1-win-db" {
  virtual_machine_id = azurerm_windows_virtual_machine.sqldb1-win.id
  sql_license_type   = "PAYG"
  sql_connectivity_port            = 1433
  sql_connectivity_type            = "PRIVATE"
  sql_connectivity_update_password = var.db_admin_pass
  sql_connectivity_update_username = var.db_admin_name
}