packer {
  required_plugins {
    windows-update = {
      version = "0.14.1"
      source = "github.com/rgl/windows-update"
    }
    vmware = {
      version = "1.0.8"
      source  = "github.com/hashicorp/vmware"
    }
  }
}