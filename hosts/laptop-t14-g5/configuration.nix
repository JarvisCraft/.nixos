{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "laptop-t14-g1";

  system.stateVersion = "25.05"; # Did you read the comment?
}
