{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ./swap.nix
    ./encryption.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "pc-1";

  system.stateVersion = "24.05";
}
