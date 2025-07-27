{ pkgs, ... }:
{
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      brlaser
      mfcl2720dwlpr
      mfcl2720dwcupswrapper
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
