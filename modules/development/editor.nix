{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.neovide
    pkgs.typora
    pkgs.wpsoffice
  ];
}
