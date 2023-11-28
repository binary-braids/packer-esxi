# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

source "vmware-iso" "windows" {
  remote_type               = "esx5"
  remote_host               = var.remote_host
  remote_port               = var.remote_port
  remote_username           = var.remote_username
  remote_password           = var.remote_password
  remote_cache_directory    = var.remote_cache_directory
  remote_datastore          = var.remote_datastore
  remote_output_directory   = var.remote_output_directory

  communicator              = "winrm"
  winrm_username            = var.winrm_username
  winrm_password            = var.winrm_password
  winrm_timeout             = "8h"


  vm_name                   = var.vm_name
  boot_command              = var.boot_command
  boot_wait                 = "10s"
  cpus                      = var.cpus
  memory                    = var.memory
  cdrom_adapter_type        = var.cdrom_adapter_type
  disk_adapter_type         = var.disk_adapter_type
  guest_os_type             = var.guest_os_type
  headless                  = var.headless
  iso_checksum              = var.iso_checksum
  iso_url                   = var.iso_url
  network_adapter_type      = var.network_adapter_type
  tools_upload_flavor       = "windows"
}

build {
  sources = ["source.hyperv-iso.vm"]

  provisioner "powershell" {
    elevated_password = "password"
    elevated_user     = "Administrator"
    script            = "./build/scripts/windows/phase-1.ps1"
  }

  provisioner "windows-restart" {
    restart_timeout = "1h"
  }

  provisioner "powershell" {
    elevated_password = "password"
    elevated_user     = "Administrator"
    script            = "./build/scripts/windows/phase-2.ps1"
  }

  provisioner "powershell" {
    elevated_password = "password"
    elevated_user     = "Administrator"
    script            = "./build/scripts/windows/phase-3.ps1"
  }

  provisioner "windows-restart" {
    pause_before          = "1m0s"
    restart_check_command = "powershell -command \"& {Write-Output 'restarted.'}\""
    restart_timeout       = "2h"
  }

  provisioner "powershell" {
    elevated_password = "password"
    elevated_user     = "Administrator"
    script            = "./build/scripts/windows/phase-3.windows-updates.ps1"
  }

  provisioner "windows-restart" {
    pause_before          = "30s"
    restart_check_command = "powershell -command \"& {Write-Output 'restarted.'}\""
    restart_timeout       = "2h"
  }

  provisioner "powershell" {
    elevated_password = "password"
    elevated_user     = "Administrator"
    inline            = ["Write-Host \"Pausing before next stage\";Start-Sleep -Seconds ${var.upgrade_timeout}"]
  }

  provisioner "powershell" {
    elevated_password = "password"
    elevated_user     = "Administrator"
    pause_before      = "30s"
    script            = "./build/scripts/windows/phase-3.windows-updates.ps1"
  }

  provisioner "windows-restart" {
    pause_before          = "30s"
    restart_check_command = "powershell -command \"& {Write-Output 'restarted.'}\""
    restart_timeout       = "2h"
  }

  provisioner "powershell" {
    elevated_password = "password"
    elevated_user     = "Administrator"
    inline            = ["Write-Host \"Pausing before next stage\";Start-Sleep -Seconds ${var.upgrade_timeout}"]
  }

  provisioner "powershell" {
    elevated_password = "password"
    elevated_user     = "Administrator"
    pause_before      = "30s"
    script            = "./build/scripts/windows/phase-3.windows-updates.ps1"
  }

  provisioner "windows-restart" {
    pause_before          = "30s"
    restart_check_command = "powershell -command \"& {Write-Output 'restarted.'}\""
    restart_timeout       = "2h"
  }

  provisioner "powershell" {
    elevated_password = "password"
    elevated_user     = "Administrator"
    inline            = ["Write-Host \"Pausing before next stage\";Start-Sleep -Seconds ${var.upgrade_timeout}"]
  }

  provisioner "powershell" {
    elevated_password = "password"
    elevated_user     = "Administrator"
    pause_before      = "30s"
    script            = "./build/scripts/windows/phase-3.windows-updates.ps1"
  }

  provisioner "windows-restart" {
    pause_before          = "30s"
    restart_check_command = "powershell -command \"& {Write-Output 'restarted.'}\""
    restart_timeout       = "2h"
  }

  provisioner "powershell" {
    elevated_password = "password"
    elevated_user     = "Administrator"
    inline            = ["Write-Host \"Pausing before next stage\";Start-Sleep -Seconds ${var.upgrade_timeout}"]
  }

  provisioner "powershell" {
    elevated_password = "password"
    elevated_user     = "Administrator"
    script            = "./build/scripts/windows/phase-5d.windows-compress.ps1"
  }

  provisioner "file" {
    destination = "C:\\Windows\\System32\\Sysprep\\unattend.xml"
    source      = "${var.sysprep_unattended}"
  }

  provisioner "powershell" {
    inline = ["Write-Output Phase-5-Deprovisioning", "if (!(Test-Path -Path $Env:SystemRoot\\system32\\Sysprep\\unattend.xml)){ Write-Output 'No file';exit (10)}", "& $Env:SystemRoot\\System32\\Sysprep\\Sysprep.exe /oobe /generalize /shutdown /quiet /unattend:C:\\Windows\\system32\\sysprep\\unattend.xml"]
  }
}