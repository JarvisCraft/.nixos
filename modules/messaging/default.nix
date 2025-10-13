{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    telegram-desktop
    element-desktop
    zoom-us
  ];
}
