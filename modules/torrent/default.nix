{ pkgs, ... }:
{
  environment.defaultPackages = [ pkgs.qbittorrent ];
}
