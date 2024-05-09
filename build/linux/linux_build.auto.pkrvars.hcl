remote_host = "#{REMOTE_HOST}#"
remote_port = 22
remote_username = "packer"
remote_password = "#{REMOTE_PASSWORD}#"
remote_cache_directory = "ISO"
remote_datastore = "VM-240GB-SSD3"
remote_output_directory = "ubuntu_template"

ssh_username = "packer"
ssh_password = "#{SSH_PASSWORD}#"

vm_name = "pkr-ubuntu-2204"
boot_command = [
  "<spacebar><wait><spacebar><wait><spacebar><wait><spacebar><wait><spacebar><wait>",
  "e<wait>",
  "<down><down><down><end>",
  " autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
  "<f10>"
]
cpus = 2
memory = "2048"
cdrom_adapter_type = "sata"
disk_adapter_type = "lsisas1068"
disk_size = 65536
disk_type_id = "thin"
guest_os_type = "ubuntu-64"
headless = true
iso_checksum = "none"
iso_url = "ubuntu_server_2204.iso"
network_adapter_type = "vmxnet3"
network_name = "VM Network"