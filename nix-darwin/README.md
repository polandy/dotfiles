# Andy's Nix Darwin Setup

* Apply Nix-darwin system configuration: `darwin-rebuild switch --flake .#"ambp"`
* Update dependencies of nix flake: `nix flake update`

## setup colima container runtime

Colima is a lightweight, open-source container runtime for macOS and Linux that provides a seamless way to run Docker workloads in a virtualized environment.
It is built on top of [Lima](https://github.com/lima-vm/lima), a project that manages Linux virtual machines on macOS, and is designed to be an alternative to Docker Desktop.

start a Colima instance, a lightweight virtual machine running a container runtime
* `colima start --vm-type=vz --vz-rosetta --cpu 2 --memory 2 --disk 20`
  * `--vm-type=vz`: specifies that the virtual machine should use Apple’s Virtualization framework (vz) instead of the default (qemu).
  * `--vz-rosetta`: Enables Rosetta 2 translation for x86/AMD64 container images on Apple Silicon (ARM64). This allows running Intel-based Docker images on an M1/M2/M3 Mac.
  * `--cpu 2`: Allocates 2 CPU cores to the virtual machine.
  * `--memory 2`: Allocates 2 GB of RAM to the virtual machine.
  * `--disk 20`: Allocates 20 GB of disk space for the virtual machine.

