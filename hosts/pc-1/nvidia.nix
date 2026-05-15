{ config, ... }:
{
  hardware = {
    graphics.enable = true;
    nvidia = {
      # Pascal architecture does not support it due to lack of GSP.
      open = false;
      # The last Nvidia driver version to support GTX 1xxx (Pascal).
      package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
      powerManagement.enable = true;
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  nixpkgs.config.nvidia.acceptLicense = true;
}
