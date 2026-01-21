{ lib, ... }:
{
  options.progrm_jarvis.virtualbox = lib.mkEnableOption "Enable VirtualBox";

  imports = [
    ./docker.nix
    ./virtualbox.nix
  ];
}
