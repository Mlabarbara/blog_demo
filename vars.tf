# SSH public key for r630-pve

variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJMgQrEOziR2AolLGajBs6x2W7D2t7n1GAhUFr+rHiKYGeKMtC4vVgTa16odyNFHbuhajwb38COnmH8lYFq4U/+Gu3K/ganoka0rJLni+UwBuBtRotece6nxAo0GWZqCOw5YJMm/OfEt4qUG050IvVqMp1X5Wtp+1CwxQ7dK2ZtNKiWrC5ORRGRKdGQACXGnt4q8kc/8zJyjencyweGOOQ6/tf9+3NhZg0zLqIJZGcML1X9cBye3xvL879WczPhfNqcYkusAeiA1T8PdL3IaYu3U49GZqlUin+i5tRBjdLYNAcYe39pkrzM4tJWV0s5nVPf4D4q9NPdyIDqGcrTMoF root@r630-pve"
}

# establish which proxmox host you would like to spin up
variable "proxmox_host" {
  default = "r630-pve"
}

# specifiy the template to use
variable "template_name" {
  default = "ubuntu-2204-template"
}

#establish the NIC to use
variable "nic_name" {
  default = "vmbr0"
}

#establish VLAN
#variable "vlan_num" {
#  default = "enter_vlan_number"
#}

#provide the url of the host you would like the API to communicate with
# it is safe to default to setting this as the URL for what you used
# as your "proxmox_host" although they can be different.
variable "api_url" {
  default = "https://192.168.11.1:8006/api2/json"
}

#blank var for use by terraform.tfvars
variable "token_secret" {

}
variable "token_id" {

}