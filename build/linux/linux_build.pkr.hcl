source "vmware-iso" "linux" {
  remote_type                       = "esx5"
  remote_host                       = var.remote_host
  remote_port                       = var.remote_port
  remote_username                   = var.remote_username
  remote_password                   = var.remote_password
  remote_cache_directory            = var.remote_cache_directory
  remote_datastore                  = var.remote_datastore
  remote_output_directory           = var.remote_output_directory

  communicator                      = "ssh"
  ssh_username                      = var.ssh_username
  ssh_password                      = var.ssh_password
  ssh_timeout                       = "2h"

  vm_name                           = var.vm_name
  boot_command                      = var.boot_command
  boot_wait                         = "10s"
  cpus                              = var.cpus
  memory                            = var.memory
  cdrom_adapter_type                = var.cdrom_adapter_type
  disk_adapter_type                 = var.disk_adapter_type
  disk_type_id                      = var.disk_type_id
  guest_os_type                     = var.guest_os_type
  version                           = "21"
  vmx_data                          = {
    "firmware"  = "efi"
    "uefi.secureBoot.enabled" = "TRUE"
  }
  vmx_remove_ethernet_interfaces    = "true"
  keep_registered                   = "true"
  headless                          = var.headless
  iso_checksum                      = var.iso_checksum
  iso_url                           = var.iso_url
  http_directory                    = "http"
  network_adapter_type              = var.network_adapter_type
  network_name                      = var.network_name
  skip_export                       = "true"
  vnc_over_websocket                = "true"
  insecure_connection               = "true"
  shutdown_command                  = "echo 'packerubuntu' | sudo -S shutdown -P now"
}

build {
  sources = ["source.vmware-iso.linux"]

  provisioner "file" {
    source = "../files/linux/regenerate_ssh_host_keys.service"
    destination = "/etc/systemd/system/regenerate_ssh_host_keys.service"    
  }

  provisioner "shell" {
    inline = [
      "sudo systemctl daemon-reload"
      "sudo systemctl enable regenerate_ssh_host_keys.service"
      ]  
  } 

  provisioner "file" {
    source = "../scripts/linux/setup.sh"
    destination = "/tmp/setup.sh"    
  }

  provisioner "shell" {
    inline = ["sudo bash /tmp/setup.sh"]  
  }
}