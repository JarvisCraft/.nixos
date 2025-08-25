{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [
    grpcurl
    grpcui
  ];
}
