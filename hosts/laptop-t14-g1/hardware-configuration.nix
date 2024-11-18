# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [
    "nvme"
    "ehci_pci"
    "xhci_pci"
    "usbhid"
    "usb_storage"
    "sd_mod"
    "rtsx_pci_sdmmc"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/7aee15db-c11f-41b4-a4c2-88b0e9a63055";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-34f3e49e-bf02-4581-b39c-b5909ef674b4".device = "/dev/disk/by-uuid/34f3e49e-bf02-4581-b39c-b5909ef674b4";
  boot.initrd.luks.devices."luks-e61d2de2-06d0-4ca6-a0fc-cd219b9faa81".device = "/dev/disk/by-uuid/e61d2de2-06d0-4ca6-a0fc-cd219b9faa81";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/D9F0-8BE5";
    fsType = "vfat";
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/38bb18d8-57f6-4b2a-a1d1-befd7f7f82c8"; } ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp2s0f0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
