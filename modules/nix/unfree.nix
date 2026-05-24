{ lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      # Web
      "google-chrome"
      # Essentials
      "rar"
      # GPU
      "nvidia-x11"
      "nvidia-settings"
      "nvidia-kernel-modules"
      # Editing
      "ffmpeg-full"
      # Fonts
      "vista-fonts"
      "corefonts"
      # Messaging
      "chatzone-desktop"
      "zoom"
      # Gaming
      "discord"
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
      # Printing
      "mfcl2720dwlpr"
      # Jetbrains
      # Temporary until `idea-oss` builds are updated to 2026.x
      "idea"
    ];
}
