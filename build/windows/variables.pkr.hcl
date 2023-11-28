variable "remote_host" {
  type    = string
}

variable "remote_port" {
  type    = number
}

variable "remote_username" {
  type    = string
}

variable "remote_password" {
  type    = string
}

variable "iso_url" {
  type    = string
}

variable "remote_cache_directory" {
  type    = string
}

variable "remote_datastore" {
  type    = string
}

variable "remote_output_directory" {
  type    = string
}

variable "winrm_username" {
  type    = string
}

variable "winrm_password" {
  type    = string
}

variable "vm_name" {
  type    = string
}

variable "boot_command" {
  type    = list(string)
}

variable "cpus" {
  type    = number
}

variable "memory" {
  type    = string
}

variable "cdrom_adapter_type" {
  type    = string
}

variable "data_directory" {
  type    = string
}

variable "disk_size" {
  type    = number
}

variable "disk_adapter_type" {
  type    = string
}

variable "guest_os_type" {
  type    = string
}

variable "headless" {
  type    = bool
}

variable "iso_url" {
  type    = string
}

variable "iso_checksum" {
  type    = string
}

variable "memory" {
  type    = number
}

variable "network_adapter_type" {
  type    = string
}

variable "upgrade_timeout" {
  type    = string
}