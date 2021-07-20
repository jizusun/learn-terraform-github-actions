# https://www.daniao.org/14035.html

provider "oci" {}

resource "oci_core_instance" "generated_oci_core_instance" {
	agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		plugins_config {
			desired_state = "DISABLED"
			name = "Vulnerability Scanning"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Custom Logs Monitoring"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Bastion"
		}
	}
	availability_config {
		recovery_action = "RESTORE_INSTANCE"
	}
	availability_domain = "pyBu:AP-SEOUL-1-AD-1"
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaa6jfy2codrwguxymqdzphaf56gd3cdsjrx5n7mfmdhdoodvnnzrvq"
	create_vnic_details {
		assign_private_dns_record = "true"
		assign_public_ip = "true"
		subnet_id = "ocid1.subnet.oc1.ap-seoul-1.aaaaaaaahmvkmgtl4wwxggqt4d5utqxd3g765tbmwnfvbh2r3lbytlfsrfha"
	}
	display_name = "instance"
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}
	metadata = {
		"ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDcrAbMbZ+iKOiwNhB0Mfeta21KZGR0XC2VD8ET77kSf6VEbqGLg7lmpHQ7Ytgpy85HaSVCg5j5jNr3H7I+KbqBoFIHR+j4OkG4AAOfwptO+9HlRKQiuaF6jYbZpi9pyFpMc8obFPlbOA2x8JkX5T/LC1gBOKaIad4tL6BIc+dPe8aFahppr6WsH67q9g0+heLxbDsqmE8O8VCXrOCW4VJoREyErJu4Y8t4003reOOuTinQB6azAhIBIbyWCGy5up3UHPRZ1GieFvkZRaq6t8/h8tvbEjYi/VFa+ycjIudCS/m6Whbbuxk79ZH6QbLZP3Z/+7JN1IYdUlJTe0qcBMeZaAMTfA6rHI2zsbNkPo0e+frSFHJ17kn6rLY3eRswBSTF6RsaicOddlo3P2pDIEBFbYO7MD4j1+rxvx3wEwtDabOb6je3ny0Gk4LFMaG7Y6+3Svt8Cfubqnca19VdWbTzvPkZbqgNijgoXegXid3wQHXMpsVjc7fo73iZvSrj3r0= jizusun@Jizus-MacBook-Pro.local"
	}
	shape = "VM.Standard.A1.Flex"
	shape_config {
		memory_in_gbs = "24"
		ocpus = "4"
	}
	source_details {
		boot_volume_size_in_gbs = "100"
		source_id = "ocid1.image.oc1.ap-seoul-1.aaaaaaaaun65t3akgpa6biuri74ed75vdl72yfd653kl3qnm4ihqqseftv6q"
		source_type = "image"
  }
}