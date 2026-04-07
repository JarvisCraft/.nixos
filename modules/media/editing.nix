{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.progrm_jarvis.ffmpeg-unfree = lib.mkEnableOption {
    type = lib.types.bool;
    default = false;
    description = "Whether to enable unfree ffmpeg components";
  };

  config.environment.systemPackages = with pkgs; [
    imagemagick
    gimp3
    pinta
    audacity
    (ffmpeg-full.override { withUnfree = config.progrm_jarvis.ffmpeg-unfree; })
  ];
}
