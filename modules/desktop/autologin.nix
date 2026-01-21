{ config, ... }:
{
  services.displayManager.autoLogin = {
    enable = true;
    user = config.progrm_jarvis.username;
  };
}
