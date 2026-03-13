# Andy's Nix Darwin Setup

* Apply Nix-darwin system configuration: `darwin-rebuild switch --flake .#"ambp"`
* Build configuration to test (without applying to system): `darwin-rebuild build --flake .#"ambp"`
* Update dependencies of nix flake: `nix flake update`

## Directory Structure

The repository follows a clean, modular structure that separates machine-specific configurations (hosts) from logical groupings of settings (modules).

```text
nix-darwin/
├── flake.nix               # Main entry point defining the configurations for all machines
├── hosts/                  # Machine-specific configurations
│   ├── amba/               # Configuration for personal Mac
│   │   ├── default.nix     # Host definition and module imports
│   │   └── home.nix        # Host-specific Home Manager configuration
│   └── ambp/               # Configuration for work Mac
│       └── default.nix     # Host definition and module imports
└── modules/                # Shared configuration modules
    ├── base/               # Foundational settings (users, core packages, basic homebrew)
    ├── devops/             # Work-related and devops tools
    ├── leisure/            # Personal and hobby applications
    ├── macos/              # macOS system settings (UI, hardware, system defaults)
    └── home-manager/       # Shared Home Manager submodules (e.g., syncthing.nix)
```

## Setup Colima Container Runtime

Colima is a lightweight, open-source container runtime for macOS and Linux that provides a seamless way to run Docker workloads in a virtualized environment.
It is built on top of [Lima](https://github.com/lima-vm/lima), a project that manages Linux virtual machines on macOS, and is designed to be an alternative to Docker Desktop.

Start a Colima instance, a lightweight virtual machine running a container runtime:
* `colima start --vm-type=vz --vz-rosetta --cpu 2 --memory 2 --disk 20`
  * `--vm-type=vz`: specifies that the virtual machine should use Apple’s Virtualization framework (vz) instead of the default (qemu).
  * `--vz-rosetta`: Enables Rosetta 2 translation for x86/AMD64 container images on Apple Silicon (ARM64). This allows running Intel-based Docker images on an M1/M2/M3 Mac.
  * `--cpu 2`: Allocates 2 CPU cores to the virtual machine.
  * `--memory 2`: Allocates 2 GB of RAM to the virtual machine.
  * `--disk 20`: Allocates 20 GB of disk space for the virtual machine.

## AeroSpace Startup Configuration

AeroSpace is configured to start automatically as a user-level service via Home Manager (`launchd.agents.aerospace.enable = true`) rather than its native `start-at-login` setting in `aerospace.toml`.

This is intentional: the native `start-at-login` mechanism registers an absolute application path in macOS Login Items. Because Nix updates often change this path in the `/nix/store`, the native registration would break after every update. Using the Home Manager `launchd` service ensures the agent always points to the current, correct version of AeroSpace provided by Nix.
