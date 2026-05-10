{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.progrm_jarvis.embedded = lib.mkEnableOption "Enable tooling for embedded development";

  config = lib.mkIf config.progrm_jarvis.embedded {
    services.udev.packages = [ pkgs.stlink ];
    environment.defaultPackages = with pkgs; [
      openocd
      stlink
      stlink-gui
      stlink-tool
    ];
  };
}
