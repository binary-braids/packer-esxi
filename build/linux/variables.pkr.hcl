variable "boot_command" {
  type    = list(string)
}

variable "build_username" {
  type    = string
}

variable "build_password" {
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

variable "hardware_version" {
  type    = number
}

variable "iso_checksum" {
  type    = string
}

variable "iso_url" {
  type    = string
}

variable "memory" {
  type    = number
}

variable "network_adapter_type" {
  type    = string
}

variable "tools_upload_flavor" {
  type    = string
}

variable "tools_upload_path" {
  type    = string
}

variable "vm_name" {
  type    = string
}

variable "vmx_data" {
  type = map(string)
}

variable "vm_guest_os_language" {
  type    = string
}

variable "vm_guest_os_keyboard" {
  type    = string
}

variable "vm_guest_os_timezone" {
  type    = string
}

variable "vm_headless" {
  type    = bool
}