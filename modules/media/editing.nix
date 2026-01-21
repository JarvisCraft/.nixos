{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    imagemagick
    gimp3
    pinta
    audacity
  ];
}
