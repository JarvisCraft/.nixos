{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.neovide
    pkgs.typora
    pkgs.wpsoffice-cn
    pkgs.pandoc
  ];
}
