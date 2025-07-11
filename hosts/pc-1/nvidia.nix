{ config, ... }:
{
  hardware = {
    graphics.enable = true;
    nvidia = {
      # Pascal architecture does not support it due to lack of GSP
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.production;
      powerManagement.enable = true;
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  nixpkgs.config.nvidia.acceptLicense = true;
}
