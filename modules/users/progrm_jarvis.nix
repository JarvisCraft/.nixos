{ pkgs, ... }:
{
  users.users.progrm_jarvis = {
    isNormalUser = true;
    description = "Petr Portnov";
    extraGroups = [
      "wheel"
      "docker"
    ];
    packages = with pkgs; [
      firefox
      libreoffice
      wpsoffice
      prismlauncher
    ];
    shell = pkgs.fish;
  };

  programs.git.config.user = {
    name = "Petr Portnov";
    email = "mrjarviscraft@gmail.com";
    signingkey = "11922217F8288484";
  };
}
