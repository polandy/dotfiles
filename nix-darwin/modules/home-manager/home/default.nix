{ primaryUser, ... }:
{
    imports = [
      ./aerospace
      ./sketchybar
      ./jankyborders
      ./packages.nix
  #    ./git.nix
  #    ./shell.nix
  #    ./mise.nix
    ];

  home = {
    username = primaryUser;
    stateVersion = "25.05";
    sessionVariables = {
      # shared environment variables
    };

    # create .hushlogin file to suppress login messages
    file.".hushlogin".text = "";
  };
}

