{ pkgs, ... }:
{
  environment.defaultPackages = [ pkgs.jetbrains.idea-community-bin ];
}
