packer {
  required_plugins {
    windows-update = {
      version = "0.15.0"
      source  = "github.com/rgl/windows-update"
    }
    vmware = {
      version = "1.0.11"
      source  = "github.com/hashicorp/vmware"
    }
  }
}