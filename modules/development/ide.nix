{ pkgs, ... }:
{
  environment.defaultPackages = [ pkgs.jetbrains.idea-oss ];
}
