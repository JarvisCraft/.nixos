{
  services = {
    desktopManager.plasma6.enable = true;
    displayManager = {
      defaultSession = "plasma";
      autoLogin = {
        enable = true;
        user = "progrm_jarvis";
      };
    };
  };
}
