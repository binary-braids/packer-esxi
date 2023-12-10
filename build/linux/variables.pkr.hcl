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

variable "remote_cache_directory" {
  type    = string
}

variable "remote_datastore" {
  type    = string
}

variable "remote_output_directory" {
  type    = string
}

variable "ssh_username" {
  type    = string
}

variable "ssh_password" {
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

variable "disk_size" {
  type    = number
}

variable "disk_adapter_type" {
  type    = string
}

variable "disk_type_id" {
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

variable "network_adapter_type" {
  type    = string
}

variable "network_name" {
  type    = string
}

variable "scripts" {
  type    = list(string)
}