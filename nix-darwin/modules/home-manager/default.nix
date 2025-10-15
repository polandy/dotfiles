{
  pkgs,
  inputs,
  self,
  primaryUser,
  ...
}:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  # home-manager config
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${primaryUser} = {
      imports = [
        ./home
      ];
    };
    extraSpecialArgs = {
      inherit primaryUser;
    };
  };

  # macOS-specific settings
  system.primaryUser = primaryUser;
  users.users.${primaryUser} = {
    home = "/Users/${primaryUser}";
    shell = pkgs.fish;
  };
  environment = {
    systemPath = [
      "/opt/homebrew/bin"
    ];
    pathsToLink = [ "/Applications" ];
  };
}

