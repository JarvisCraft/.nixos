{
  lib,
  config,
  pkgs,
  ...
}:
{

  config = lib.mkIf config.progrm_jarvis.games {
    environment.defaultPackages = [ pkgs.discord ];
  };
}
