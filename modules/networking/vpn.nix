{ pkgs, ... }:
{
  programs.openvpn3.enable = true;
  networking.networkmanager.plugins = [
    pkgs.networkmanager-openvpn
  ];
}
