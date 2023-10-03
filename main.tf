terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  # reference out vars.tf file to plug in the api_url
  pm_api_url = var.api_url
  #reference the var.tf token
  pm_api_token_id = var.token_id
  # reference the vars.tf secret 
  pm_api_token_secret = var.token_secret
  #default to 'true' unless you have TLS working within your pve setup
  pm_tls_insecure = true
  # lets try debug mod
  pm_debug = true
}

# create a proxmox_vm_qemu entity named blog_demo
resource "proxmox_vm_qemu" "blog-demo-test" {
  name = "test-vm${count.index + 1}" #count.index starts at 0
  #name = "test-vm-11"
  count = 4 # establish how many instances will be created
  target_node = var.proxmox_host

  #reference the vars.tf file to plug in our template
  clone = var.template_name
  #creates a full clone rather than a linked clone
  full_clone = "true"

  # vm settings. 'agent = 1' enables qemu-guest-agent
  agent = 1
  os_type = "cloud-init"
  cores = 2 
  sockets = 1
  cpu = "host"
  memory = 2048
#  scsihw = "virtio-scsi-pci"
#  bootdisk = "scsi0"

#  disk {
#    slot = 0
#    size = "50G"
#    type = "scsi"
#   storage = "nvme001" # name of the proxmox storage where you want the disk 
    # enables SSD emulation
#    discard = "on"
    #iothread = 1 
#  }
  network {
    model = "virtio"
    bridge = var.nic_name
    # tag = var.vlan_num ### empty since I am not using VLANs yet.
  }

  lifecycle {
    ignore_changes = [ 
      network,
     ]
  }

  #provisioner "local-exec" {
    #provisioner commands ran here
    # will use with ansible?
    # i don't have any clue yet lol will come back to this one
  #}
}