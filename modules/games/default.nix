{ lib, ... }:
{
  options.progrm_jarvis.games = lib.mkEnableOption "Enable games";

  imports = [
    ./steam.nix
    ./minecraft.nix
    ./discord.nix
  ];
}
