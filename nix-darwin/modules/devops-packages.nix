{ config, pkgs, lib, self, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.jetbrains.gateway
    pkgs.jetbrains.idea-ultimate
    pkgs.openshift
    pkgs.minio-client
    pkgs.vault

    pkgs.kubeconform
    pkgs.kube-linter
    pkgs.yamllint
    pkgs.kubernetes-helm
    pkgs.yq
  ];

}