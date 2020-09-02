// Manage the Student Access Group with RWX access policies to Power IaaS resources

resource "ibm_iam_access_group" "accgroup" {
  name = var.poweriaas_accessgrp_name
}

data "ibm_resource_group" "group" {
  name = var.poweriaas_resourcegrp_name 
}

resource "ibm_iam_access_group_policy" "policy1" {

	access_group_id = ibm_iam_access_group.accgroup.id
	roles = ["Viewer", "Operator","Editor" ]
	resources {
		resource_type = "resource-group"
        	resource = data.ibm_resource_group.group.id
        }
}

resource "ibm_iam_access_group_policy" "policy2" {
        access_group_id = ibm_iam_access_group.accgroup.id
	roles = ["Viewer", "Operator","Editor", "Reader","Manager"]
        resources {
	 	resource_group_id = data.ibm_resource_group.group.id
		service = "power-iaas"
         }
}

// Manage users and services attached to the Students Access Group and policies to Power IaaS and power-cloud resource group 
resource "ibm_iam_service_id" "power-service" {
  name = var.poweriaas_service_name
  description = "Power-IaaS-Service - used by Terraform / Ansible / ibmcloud CLI"
}
resource "ibm_iam_user_invite" "invite_user" {
    users = var.poweriaas_users
    access_groups = [ ibm_iam_access_group.accgroup.id ]
}
resource "ibm_iam_access_group_members" "accgroupmem" {
  depends_on           = [ibm_iam_user_invite.invite_user]
  access_group_id = ibm_iam_access_group.accgroup.id
  ibm_ids         = var.poweriaas_users
  iam_service_ids = [ibm_iam_service_id.power-service.id]
}

