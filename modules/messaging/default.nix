{ pkgs, ... }:
{
  programs.zoom-us.enable = true;

  environment.systemPackages = with pkgs; [
    telegram-desktop
    element-desktop
  ];
}
