remote_host = "#{REMOTE_HOST}#"
remote_port = #{REMOTE_PORT}#
remote_username = "#{REMOTE_USERNAME}#"
remote_password = "#{REMOTE_PASSWORD}#"
remote_cache_directory = "#{REMOTE_CACHE_DIRECTORY}#"
remote_datastore = "#{REMOTE_DATASTORE}#"
remote_output_directory = "#{REMOTE_OUTPUT_DIRECTORY}#"

ssh_username = "#{SSH_USERNAME}#"
ssh_password = "#{SSH_PASSWORD}#"

vm_name = "#{VM_NAME}#"
boot_command = [
  "<spacebar><wait><spacebar><wait><spacebar><wait><spacebar><wait><spacebar><wait>",
  "e<wait>",
  "<down><down><down><end>",
  " autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
  "<f10>"
]
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