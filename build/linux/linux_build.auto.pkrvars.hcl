remote_host = "#{remote_host}#"
remote_port = #{remote_port}#
remote_username = "#{remote_username}#"
remote_password = "#{remote_password}#"
remote_cache_directory = "#{remote_cache_directory}#"
remote_datastore = "#{remote_datastore}#"
remote_output_directory = "#{remote_output_directory}#"

ssh_username = "#{ssh_username}#"
ssh_password = "#{ssh_password}#"

vm_name = "#{vm_name}#"
boot_command = [
  "<spacebar><wait><spacebar><wait><spacebar><wait><spacebar><wait><spacebar><wait>",
  "e<wait>",
  "<down><down><down><end>",
  " autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
  "<f10>"
]
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