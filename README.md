# 2 Tier Deployment with Virtual Machine Scale Set SQL Database & Bastion
This plan is used to build 2-tier infrastructure in same location and same VNet.
A Front End Load Balancer connecting to VMSS

Tier 1 - VMSS (Web Servers with Rolling Update)
Tier 2 - SQL DB Server 
## What Does this plan do ?
A total of 22 resources are created.

1. Creates a 1 Resource Group in westus2
2. Creates 1 Virtual Network
3. Creates 3 Subnets
   * bastion-subnet 
   * tier1-subnet
   * tier2-subnet
4. Creates 2 Network Security Group
5.  Creates 2 Public IPs
    * Bastion
    * Load Balancer
6.  Creates 1 Virtual Machine Scale Set with 2 Instances
    * SKU : Windows Server 2019
    * Instance Size : Standard_B2s
    * Instance are enabled with custom extension to deploy IIS
    * Automating Rolling Update enabled for Instances
7. Load Balancer
    * Front End : Public IP  
    * Back End  : VMSS
8. Creates 1 Database Server
    * Instance Size : Standard_B2s
    * Offer : SQL 2017 on Ws2019
    * SKU : SQLDEV
9. Configures SQL Server
    * Sets Licensing Model : Pay-As-You-Go
    * Login Credentials
10. Creates Bastion Host

authenticate using : 
```
az login
```

post authentication token is received :

```
terraform init
terraform plan
terraform apply
```

*connection to bastion from internet is allowed by default*
*connection from bastion to all subnets in VNet is allowed by default*
*NSGs should be appropriately configured*