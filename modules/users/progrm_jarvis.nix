{ pkgs, ... }:
let
  username = "progrm_jarvis";
in
{
  users.users.${username} = {
    isNormalUser = true;
    description = "Petr Portnov";
    extraGroups = [
      "wheel"
      "docker"
      "vboxusers"
    ];
    packages = with pkgs; [
      libreoffice
      prismlauncher
    ];
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBqwhIGYMJynS7sLGUhV8Q0lD4j8tjUMBP9oXUHx3g90 openpgp:0x7C00EA6A"
    ];
  };

  nix.settings.trusted-users = [ username ];

  programs.git.config.user = {
    name = "Petr Portnov";
    email = "mrjarviscraft@gmail.com";
    signingkey = "11922217F8288484";
  };

  security.pam.services.${username}.kwallet = {
    enable = true;
    package = pkgs.kdePackages.kwallet-pam;
  };
}
