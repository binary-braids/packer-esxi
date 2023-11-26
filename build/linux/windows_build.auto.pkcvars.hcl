boot_command = ["<esc><wait>", "<esc><wait>", "<enter><wait>", "/install/vmlinuz<wait>", " initrd=/install/initrd.gz", " auto-install/enable=true", " debconf/priority=critical", " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg<wait>", " -- <wait>", "<enter><wait>"]
build_username = "vagrant"
build_password = "vagrant"
cdrom_adapter_type = "sata"
data_directory = "null"
disk_size = 65536
disk_adapter_type = "lsilogic"
guest_os_type = null
hardware_version = 19
iso_checksum = null
iso_url = null
memory = null
network_adapter_type = null
tools_upload_flavor = null
tools_upload_path = null
vm_name = "debian"
vmx_data = {
    "cpuid.coresPerSocket" = "2"
  }
vm_guest_os_language = "en"
vm_guest_os_keyboard = "us"
vm_guest_os_timezone = "UTC"
vm_headless = true