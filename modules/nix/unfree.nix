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
      "zoom"
      # Development
      "typora"
      "wpsoffice-cn"
      "lens-desktop"
      # Steam
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
      # Misc
      "via"
      # Drivers
      "mfcl2720dwlpr"
    ];
}
