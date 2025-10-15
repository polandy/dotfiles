{ pkgs, ... }:

let
  aerospaceConfigPath = ./aerospace.toml;
in
{
  home.packages = with pkgs; [
    aerospace
  ];

  home.file.".config/aerospace/aerospace.toml" = {
    source = aerospaceConfigPath;
    # writable = true;
  };
}
