{ lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      # Essentials
      "rar"
      # Drivers
      "nvidia-x11"
      "nvidia-settings"
      # Fonts
      "vista-fonts"
      "corefonts"
      # Messaging
      "chatzone-desktop"
      # Development
      "typora"
      "wpsoffice"
      "lens-desktop"
      # Steam
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
      # Misc
      "via"
    ];
}
