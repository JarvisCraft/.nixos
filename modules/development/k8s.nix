{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [
    kubectl
    kubectx
    lens
  ];
}
