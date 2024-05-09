remote_host = "#{REMOTE_HOST}#"
remote_port = 22
remote_username = "packer"
remote_password = "#{REMOTE_PASSWORD}#"
remote_cache_directory = "ISO"
remote_datastore = "VM-240GB-SSD3"
remote_output_directory = "windows_template"

winrm_username = "Administrator"
winrm_password = "#{WINRM_PASSWORD}#"

floppy_files = [
    "../scripts/windows/autounattend.xml",
    "../scripts/windows/bootstrap.ps1",
    "../scripts/windows/install-vm-tools.cmd"
]

vm_name = "pkr-win2022-dc"
boot_command = ["a<enter><wait>a<enter><wait>a<enter><wait>a<enter>"]
cpus = 2
memory = "2048"
cdrom_adapter_type = "sata"
disk_adapter_type = "lsisas1068"
disk_size = 65536
disk_type_id = "thin"
guest_os_type = "windows2019srvNext-64"
headless = true
iso_checksum = "none"
iso_url = "windows_server_2022.iso"
network_adapter_type = "vmxnet3"
network_name = "VM Network"

upgrade_timeout = 60
sysprep_unattended = "../scripts/windows/unattend.xml"