{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    imagemagick
    gimp3
    pinta
    audacity
    (pkgs.ffmpeg-full.override { withUnfree = true; })
  ];
}
