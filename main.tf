# https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/terraformproviderconfiguration.htm
variable "tenancy_ocid" { }
# variable "user_ocid" {}
# variable "fingerprint" {}
# variable "private_key_path" {}
# variable "region" {}
variable "subnet_id" { }
variable "ssh_authorized_keys" { }

variable "source_id" {
  default = "ocid1.image.oc1.ap-seoul-1.aaaaaaaaun65t3akgpa6biuri74ed75vdl72yfd653kl3qnm4ihqqseftv6q"
}

variable "shape" {
  default = "VM.Standard.A1.Flex"
}


# Configure the OCI provider with an API Key
# tenancy_ocid is the compartment OCID for the root compartment
provider "oci" {
  tenancy_ocid = var.tenancy_ocid
#   user_ocid = var.user_ocid
#   fingerprint = var.fingerprint
#   private_key_path = var.private_key_path
#   region = var.region
}

# Get a list of Availability Domains
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}



# https://docs.oracle.com/en-us/iaas/developer-tutorials/tutorials/tf-compute/01-summary.htm
resource "oci_core_instance" "free_arm_instance1" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.tenancy_ocid
    shape = var.shape 
    source_details {
        source_id = var.source_id
        source_type = "image"
    }

    # Optional
    display_name = "free_arm_instance1"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = var.subnet_id
    }
    metadata = {
        ssh_authorized_keys = var.ssh_authorized_keys
    } 
    preserve_boot_volume = false
}



output "public-ip-for-compute-instance" {
  value = oci_core_instance.free_arm_instance1.public_ip
}