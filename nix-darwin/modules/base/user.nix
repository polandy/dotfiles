{ config, pkgs, self, ... }:

{
  users.users.andy = {
    name = "andy";
    home = "/Users/andy";
  };
  system = {
    primaryUser = "andy";
  };
}
