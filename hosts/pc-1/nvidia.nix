{ config, ... }:
{
  boot.kernelParams = [ "nomodeset" ];
  hardware = {
    graphics.enable = true;
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      open = false;
    };

  };
  services.xserver.videoDrivers = [ "nvidia" ];
  nixpkgs.config.nvidia.acceptLicense = true;
}
