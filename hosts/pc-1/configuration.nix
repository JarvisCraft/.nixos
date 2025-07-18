{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ./swap.nix
    ./encryption.nix
  ];

  networking.hostName = "pc-1";

  system.stateVersion = "24.05";
}
