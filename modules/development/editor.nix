{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neovide
    typora
    libreoffice
    wpsoffice-cn
    pandoc
  ];
}
