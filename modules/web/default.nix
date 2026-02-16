{ pkgs, ... }:
{
  programs = {
    firefox.enable = true;
    chromium = {
      enable = true;
      extraOpts.DefaultBrowserSettingEnabled = false;
    };
  };
  environment.defaultPackages = [
    pkgs.google-chrome
  ];
}
