{ pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  environment.systemPackages = with pkgs; [
    kde-gruvbox
    gruvbox-plus-icons
    gruvbox-gtk-theme
    gruvbox-kvantum
    capitaine-cursors-themed
  ];
}
