{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    settings.theme = "gruvbox-dark";
  };

  environment.systemPackages = with pkgs; [
    zip
    unzip
    rar
    fd
    killall
    usbutils
    btop
    zenith
    eza
    ripgrep
    jq
    rsync
    zellij
  ];

  environment.shellAliases.ls = "eza";
}
