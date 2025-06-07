{
  imports = [
    ./unfree.nix
    ./index.nix
  ];
  nix = {
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
