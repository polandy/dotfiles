{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    homebank
  ];

}
