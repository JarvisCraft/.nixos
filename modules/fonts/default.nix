{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    meslo-lgs-nf
    jetbrains-mono
    corefonts
    vistafonts
  ];
}
