variable "ibmcloud_api_key" {
    description = "Denotes the IBM Cloud API key to use"
}

variable "ibmcloud_region" {
  description = "Denotes which IBM Cloud region to connect to"
  default     = "eu-de"
}

variable "ibmcloud_zone" {
  description = "Denotes the zone within the region to connect to (only needed for multi-zone regions--e.g., eu-de-1)"
  default     = "eu-de-1"
}

variable "poweriaas_users" {
    description = "Array,list of IBMIDs"
    default     = ["benoit.marolleau@gmail.com", "thierry.huche@fr.ibm.com","fred.dubois@fr.ibm.com", "ludovic_menard@fr.ibm.com"]
}

variable "poweriaas_resourcegrp_name" {
    description = "Resource Group name for ease of management. Ex: dev,prod,lab,power-cloud etc... Not managed by TF,to be created before running this script - Manage,Account,Resource Groups"
    default     = "power-cloud"
}

variable "poweriaas_accessgrp_name" {
    description = "Access Group , to be created and managed by Terraform, grouping the users and service , with RWX policies the Power IaaS "
     default     = "LAB-STUDENTS-lab1" 
}

variable "poweriaas_service_name" {
    description = "Service ID attached to the Access Group, to be used by apps for example. Ansible, TF, cli, API,..."
    default     = "Power-IaaS-Service"
}

  
