{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "linuxnb-pportnov-PF5922RD";

  system.stateVersion = "25.05"; # Did you read the comment?
}
