{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    pjnvim = {
      url = "github:JarvisCraft/pjnvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
  };
  outputs =
    {
      nixpkgs,
      flake-utils,
      pjnvim,
      ...
    }:
    let
      commonModules = [
        ./modules
        (
          { config, ... }:
          {
            environment.systemPackages = [ pjnvim.packages.${config.nixpkgs.system}.nvim ];
          }
        )
      ];
      modules = {
        pc-1 = commonModules ++ [ ./hosts/pc-1/configuration.nix ];
      };
    in
    {
      nixosConfigurations.pc-1 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = modules.pc-1;
      };
    }
    // flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell { };
        formatter = pkgs.nixfmt-rfc-style;
      }
    );
}
