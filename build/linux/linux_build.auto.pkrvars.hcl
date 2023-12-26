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
  "<esc><esc><esc><esc>e<wait>",
  "<del><del><del><del><del><del><del><del><del><del>",
  "<del><del><del><del><del><del><del><del><del><del>",
  "<del><del><del><del><del><del><del><del><del><del>",
  "<del><del><del><del><del><del><del><del><del><del>",
  "<del><del><del><del><del><del><del><del><del><del>",
  "<del><del><del><del><del><del><del><del><del><del>",
  "<del><del><del><del><del><del><del><del><del><del>",
  "<del><del><del><del><del><del><del><del><del><del>",
  "<del><del><del><del><del><del><del><del><del><del>",
  "<del><del><del><del><del><del><del><del><del><del>",
  "<del><del><del><del><del><del><del><del><del><del>",
  "<del><del><del>",
  "linux /casper/vmlinuz --- autoinstall ds=\"nocloud-net;seedfrom=http://[{{.HTTPIP}}]:{{.HTTPPort}}/\"<enter><wait>",
  "initrd /casper/initrd<enter><wait>",
  "boot<enter>",
  "<enter><f10><wait>"
]
cpus = #{cpus}#
memory = "#{memory}#"
cdrom_adapter_type = "sata"
disk_adapter_type = "lsisas1068"
disk_size = 65536
disk_type_id = "thin"
guest_os_type = "#{guest_os_type}#"
headless = true
iso_checksum = "sha256:84aeaf7823c8c61baa0ae862d0a06b03409394800000b3235854a6b38eb4856f"
iso_url = "#{iso_url}#"
network_adapter_type = "#{network_adapter_type}#"
network_name = "#{network_name}#"