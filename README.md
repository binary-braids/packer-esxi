[![Host 01 Build](https://github.com/binary-braids/packer-esxi/actions/workflows/host_01_build.yml/badge.svg)](https://github.com/binary-braids/packer-esxi/actions/workflows/host_01_build.yml)
[![Host 02 Build](https://github.com/binary-braids/packer-esxi/actions/workflows/host_02_build.yml/badge.svg)](https://github.com/binary-braids/packer-esxi/actions/workflows/host_02_build.yml.yml)
[![Packer Validation CI](https://github.com/binary-braids/packer-esxi/actions/workflows/validation.yml/badge.svg)](https://github.com/binary-braids/packer-esxi/actions/workflows/validation.yml)

[![packer](https://img.shields.io/badge/Packer-blue?style=for-the-badge&logo=Packer)]((https://www.packer.io))
[![renovate](https://img.shields.io/badge/renovate-enabled-brightgreen?style=for-the-badge&logo=renovatebot)](https://github.com/renovatebot/renovate)
[![HitCount](https://hits.dwyl.com/binary-braids/packer-esxi.svg?style=for-the-badge&show=unique)](http://hits.dwyl.com/binary-braids/packer-esxi)

# Packer ESXI

This repository contains Packer builds for my ESXI homelab. The [github.com/hashicorp/vmware](https://github.com/hashicorp/packer-plugin-vmware) plugin is being used which invokes the `vmware-iso` builder to build the images.

## OS Versions

The table below lists the OS Versions image build templates available in this repository.

| 🐧 Linux | 🪟 Windows |
| -------- | ---------- |
| Ubuntu 22.04 LTS | Windows Server 2022 Datacenter

## 📂 Repository structure

The Git repository contains the following directories:

```sh
📁 root
├─📁 .github        # GitHub Actions workflows
├─📁 ansible        # Ansible playbooks for Packer related tasks
├─📁 build          # Contains the Packer build files
```


