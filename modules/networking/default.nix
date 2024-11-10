{
  imports = [
    ./management.nix
    ./dns.nix
    ./vpn.nix
  ];

  services.resolved.enable = true;
}
