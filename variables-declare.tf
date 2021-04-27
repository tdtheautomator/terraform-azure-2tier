#Declare Variables
variable "location" {}

variable "vnet_cidr" {}
variable "bastion_subnet_cidr" {}
variable "tier1_subnet_cidr" {}
variable "tier2_subnet_cidr" {}

variable "win_admin_name" {}
variable "win_admin_pass" {}
variable "win_compute_size" {}
variable "win_sku" {}
variable "vmss-tier1-prefix" {}

variable "db_admin_name" {}
variable "db_admin_pass" {}
variable "db_offer" {}
variable "db_sku" {}
variable "db_compute_size" {}