{ lib, config, ... }:
{
  config = lib.mkIf config.progrm_jarvis.games {
    programs.steam.enable = true;
  };
}
