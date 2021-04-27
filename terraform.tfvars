location = "westus2"

vnet_cidr = "10.10.0.0/16"
bastion_subnet_cidr = "10.10.50.0/24"
tier1_subnet_cidr = "10.10.10.0/24"
tier2_subnet_cidr = "10.10.20.0/24"

win_admin_name = "vmadmin"
win_admin_pass = "vmP@ssword.123"
win_compute_size = "Standard_B2s"
win_sku = "2019-Datacenter"

vmss-tier1-prefix = "vm-tier1"

db_admin_name = "dbadmin"
db_admin_pass = "dbP@ssword.123"
db_offer = "sql2017-ws2019"
db_sku = "sqldev"
db_compute_size = "Standard_B2s"