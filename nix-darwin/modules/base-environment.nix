{ config, pkgs, lib, self, ... }:

{
  environment.variables = {
    editor = "nvim";
    LANG = "en_US.UTF-8";
  };

}
