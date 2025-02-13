{ pkgs, ... }:
{
  imports = [
    ./unfree.nix
    ./index.nix
  ];
  nix = {
    package = pkgs.nixVersions.nix_2_26;
    settings = {
      sync-before-registering = true;
      system-features = [ "recursive-nix" ];
      builders-use-substitutes = true;
      experimental-features = [
        "nix-command"
        "flakes"
        "recursive-nix"
        "ca-derivations"
        "auto-allocate-uids"
        "cgroups"
      ];
      use-cgroups = true;
      auto-optimise-store = true;
    };
  };
}
