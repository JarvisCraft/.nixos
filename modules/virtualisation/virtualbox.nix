{ lib, config, ... }:
{
  config = lib.mkIf config.progrm_jarvis.virtualbox {
    virtualisation.virtualbox.host.enable = true;

    users.users.${config.progrm_jarvis.username}.extraGroups = [ "vboxusers" ];
  };
}
