{ lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      # Drivers
      "nvidia-x11"
      "nvidia-settings"
      # Fonts
      "vista-fonts"
      "corefonts"
      # Messaging
      "discord"
      "chatzone-desktop"
      # Development
      "lens-desktop"
    ];
}
