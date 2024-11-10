{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zip
    unzip
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
