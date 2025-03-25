{ config, pkgs, ... }:

{
  users.extraUsers.andy = {
    extraGroups = [ "wheel" "disk" "networkmanager" "docker" ];
    createHome = true;
    isNormalUser = true;
    group = "users";
    shell = pkgs.fish;
    uid = 1026;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFfNq2DNl40vQ/elQobwsNGeza0h+yYrE1p7AYi2oHV7 andy@coolermaster"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICpRQJlShyRU0eqFbAeoHoaLi+nlRY+S9KyjIIdLA1Bp andy@x1"
    ];
  };

  programs.fish.enable = true;
}
