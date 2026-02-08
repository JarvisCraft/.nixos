{ lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      # Web
      "google-chrome"
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
      # Steam
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
      # Misc
      "via"
      # Drivers
      "mfcl2720dwlpr"
      # Embedded development
      "adafruit-nrfutil"
    ];
}
