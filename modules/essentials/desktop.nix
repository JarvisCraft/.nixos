{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    baobab
    solaar
  ];
}
