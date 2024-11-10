{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.alacritty ];
  console.useXkbConfig = true;
}
