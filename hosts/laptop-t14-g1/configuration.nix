{
  imports = [
    ./hardware-configuration.nix
    ./bluetooth.nix
    ./opencl.nix
  ];

  networking.hostName = "laptop-t14-g1";

  system.stateVersion = "23.11";
}
