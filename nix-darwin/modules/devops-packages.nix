{pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs;  [
    jetbrains.gateway
    jetbrains.idea-ultimate
    openshift
    minio-client
    vault

    kubectl
    kubectl-validate
    kubeconform
    kube-linter
    kubernetes-helm
    yamllint
    yq
    k9s
  ];

}
