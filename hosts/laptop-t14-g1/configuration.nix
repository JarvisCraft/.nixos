{
  imports = [
    ./hardware-configuration.nix
    ./bluetooth.nix
    ./opencl.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "laptop-t14-g1";

  system.stateVersion = "23.11";
}
