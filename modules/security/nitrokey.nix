{ pkgs, ... }:
{
  services.udev.packages = [ pkgs.nitrokey-udev-rules ];
}
