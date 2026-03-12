{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    includes = [ "~/.colima/ssh_config" ];
    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
        extraOptions = {
          UseKeychain = "yes";
        };
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}
