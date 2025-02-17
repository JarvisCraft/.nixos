{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zip
    unzip
    rar
    fd
    killall
    usbutils
    bat
    btop
    zenith
    eza
    ripgrep
    jq
    rsync
    zellij
  ];
}
