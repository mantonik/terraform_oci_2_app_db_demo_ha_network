# terraform_oci_2_app_db_demo_ha_network
Terraform script to setup HA network using Always Free Tier in Oracle Cloud

This script will setup 

Compartment 
VCN
Reserved IP 
Load Balancer 
2 VM app server (AMD)

optional if we can complete this
1 VM database server (ARM)

Security list to allow connection over port 80 and https

Setup in your OCI console

mkdir git
cd git 
#clone repository
git@github.com:mantonik/terraform_oci_2_app_db_demo_ha_network.git

Add SSH key to your account which allow authentication call 

Clone repository ( public )
git clone --single-branch --branch dev  git@github.com:mantonik/terraform_oci_2_app_db_demo_ha_network.git

# pull changes 

git pull 

git fetch origin dev

git merge origin/dev 

