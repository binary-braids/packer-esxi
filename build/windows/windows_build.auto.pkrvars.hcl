remote_host = "#{REMOTE_HOST}#"
remote_port = #{REMOTE_PORT}#
remote_username = "#{REMOTE_USERNAME}#"
remote_password = "#{REMOTE_PASSWORD}#"
remote_cache_directory = "#{REMOTE_CACHE_DIRECTORY}#"
remote_datastore = "#{REMOTE_DATASTORE}#"
remote_output_directory = "#{REMOTE_OUTPUT_DIRECTORY}#"

winrm_username = "#{WINRM_USERNAME}#"
winrm_password = "#{WINRM_PASSWORD}#"

floppy_files = [
    "../scripts/windows/autounattend.xml",
    "../scripts/windows/bootstrap.ps1",
    "../scripts/windows/install-vm-tools.cmd"
]

vm_name = "#{VM_NAME}#"
boot_command = ["a<enter><wait>a<enter><wait>a<enter><wait>a<enter>"]
cpus = #{CPUS}#
memory = "#{MEMORY}#"
cdrom_adapter_type = "sata"
disk_adapter_type = "lsisas1068"
disk_size = 65536
disk_type_id = "thin"
guest_os_type = "#{guest_os_type}#"
headless = true
iso_checksum = "none"
iso_url = "#{ISO_URL}#"
network_adapter_type = "#{NETWORK_ADAPTER_TYPE}#"
network_name = "#{NETWORK_NAME}#"

upgrade_timeout = 60
sysprep_unattended = "../scripts/windows/unattend.xml"