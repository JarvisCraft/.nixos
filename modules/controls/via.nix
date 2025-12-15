{ pkgs, ... }:
{
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';
  environment.systemPackages = with pkgs; [
    via
    qmk
  ];

  hardware.keyboard.qmk.enable = true;
}
