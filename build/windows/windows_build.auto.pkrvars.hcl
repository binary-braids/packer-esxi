remote_host = "#{remote_host}#"
remote_port = #{remote_port}#
remote_username = "#{remote_username}#"
remote_password = "#{remote_password}#"
remote_cache_directory = "#{remote_cache_directory}#"
remote_datastore = "#{remote_datastore}#"
remote_output_directory = "#{remote_output_directory}#"

winrm_username = "#{winrm_username}#"
winrm_password = "#{winrm_password}#"

floppy_files = [
    "../scripts/windows/autounattend.xml",
    "../scripts/windows/bootstrap.ps1",
    "../scripts/windows/install-vm-tools.cmd"
]

vm_name = "#{vm_name}#"
boot_command = ["a<enter><wait>a<enter><wait>a<enter><wait>a<enter>"]
cpus = #{cpus}#
memory = "#{memory}#"
cdrom_adapter_type = "sata"
disk_adapter_type = "lsisas1068"
disk_size = 65536
disk_type_id = "thin"
guest_os_type = "#{guest_os_type}#"
headless = true
iso_checksum = "none"
iso_url = "#{iso_url}#"
network_adapter_type = "#{network_adapter_type}#"
network_name = "#{network_name}#"

upgrade_timeout = 60
sysprep_unattended = "../scripts/windows/unattend.xml"