source "vmware-iso" "windows" {
  remote_type             = "esx5"
  remote_host             = var.remote_host
  remote_port             = var.remote_port
  remote_username         = var.remote_username
  remote_password         = var.remote_password
  remote_cache_directory  = var.remote_cache_directory
  remote_datastore        = var.remote_datastore
  remote_output_directory = var.remote_output_directory

  communicator   = "winrm"
  winrm_username = var.winrm_username
  winrm_password = var.winrm_password
  winrm_timeout  = "8h"
  winrm_use_ssl  = "true"
  winrm_insecure = "true"

  floppy_files       = var.floppy_files
  vm_name            = var.vm_name
  boot_command       = var.boot_command
  boot_wait          = "10s"
  cpus               = var.cpus
  memory             = var.memory
  cdrom_adapter_type = var.cdrom_adapter_type
  disk_adapter_type  = var.disk_adapter_type
  disk_type_id       = var.disk_type_id
  guest_os_type      = var.guest_os_type
  version            = "21"
  vmx_data = {
    "firmware"                = "efi"
    "uefi.secureBoot.enabled" = "TRUE"
  }
  headless             = var.headless
  iso_checksum         = var.iso_checksum
  iso_url              = var.iso_url
  network_adapter_type = var.network_adapter_type
  network_name         = var.network_name
  skip_export          = "true"
  vnc_over_websocket   = "true"
  insecure_connection  = "true"
}

build {
  sources = ["source.vmware-iso.windows"]

  provisioner "powershell" {
    elevated_password = var.winrm_password
    elevated_user     = var.winrm_username
    script            = "../scripts/windows/phase-1.ps1"
  }

  provisioner "windows-restart" {
    restart_timeout = "1h"
  }

  provisioner "powershell" {
    elevated_password = var.winrm_password
    elevated_user     = var.winrm_username
    script            = "../scripts/windows/phase-2.ps1"
  }

  provisioner "windows-restart" {
    pause_before          = "1m0s"
    restart_check_command = "powershell -command \"& {Write-Output 'restarted.'}\""
    restart_timeout       = "2h"
  }

  provisioner "powershell" {
    elevated_password = var.winrm_password
    elevated_user     = var.winrm_username
    script            = "../scripts/windows/phase-3.windows-updates.ps1"
  }

  provisioner "windows-restart" {
    pause_before          = "30s"
    restart_check_command = "powershell -command \"& {Write-Output 'restarted.'}\""
    restart_timeout       = "2h"
  }

  provisioner "powershell" {
    elevated_password = var.winrm_password
    elevated_user     = var.winrm_username
    inline            = ["Write-Host \"Pausing before next stage\";Start-Sleep -Seconds ${var.upgrade_timeout}"]
  }

  provisioner "powershell" {
    elevated_password = var.winrm_password
    elevated_user     = var.winrm_username
    pause_before      = "30s"
    script            = "../scripts/windows/phase-3.windows-updates.ps1"
  }

  provisioner "windows-restart" {
    pause_before          = "30s"
    restart_check_command = "powershell -command \"& {Write-Output 'restarted.'}\""
    restart_timeout       = "2h"
  }

  provisioner "powershell" {
    elevated_password = var.winrm_password
    elevated_user     = var.winrm_username
    inline            = ["Write-Host \"Pausing before next stage\";Start-Sleep -Seconds ${var.upgrade_timeout}"]
  }

  provisioner "powershell" {
    elevated_password = var.winrm_password
    elevated_user     = var.winrm_username
    inline            = ["Write-Host \"Pausing before next stage\";Start-Sleep -Seconds ${var.upgrade_timeout}"]
  }

  provisioner "powershell" {
    elevated_password = var.winrm_password
    elevated_user     = var.winrm_username
    script            = "../scripts/windows/phase-4d.windows-compression.ps1"
  }

  provisioner "file" {
    destination = "C:\\Windows\\System32\\Sysprep\\unattend.xml"
    source      = "${var.sysprep_unattended}"
  }

  provisioner "powershell" {
    inline = ["Write-Output Phase-5-Deprovisioning", "if (!(Test-Path -Path $Env:SystemRoot\\system32\\Sysprep\\unattend.xml)){ Write-Output 'No file';exit (10)}", "& $Env:SystemRoot\\System32\\Sysprep\\Sysprep.exe /oobe /generalize /quit /quiet /unattend:C:\\Windows\\system32\\sysprep\\unattend.xml"]
  }
}