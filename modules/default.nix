{ lib, ... }:
{
  options.progrm_jarvis.username = lib.mkOption {
    default = "progrm_jarvis";
    type = lib.types.str;
    description = ''
      Primary system username.
    '';
  };

  imports = [
    ./nix
    ./hardware
    ./boot
    ./security
    ./git
    ./direnv
    ./pjnvim
    ./users
    ./fonts
    ./shell
    ./localization
    ./printing
    ./messaging
    ./networking
    ./ssh
    ./essentials
    ./desktop
    ./controls
    ./sound
    ./media
    ./web
    ./development
    ./virtualisation
    ./work
    ./games
    ./torrent
  ];
}
