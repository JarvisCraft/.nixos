{ config, ... }:
{
  boot.kernelParams = [ "nomodeset" ];
  hardware = {
    graphics.enable = true;
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      # Pascal architecture does not support it due to lack of GSP.
      open = false;
      powerManagement.enable = true;
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  nixpkgs.config.nvidia.acceptLicense = true;
}
