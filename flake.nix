{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    fleet = {
      url = "github:CertainLach/fleet";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };
    pjnvim = {
      url = "github:JarvisCraft/pjnvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ nixpkgs, fleet, flake-parts, pjnvim, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ fleet.flakeModules.default ];
      systems = [ "x86_64-linux" ];

      perSystem = { pkgs, system, inputs', ... }: {
        formatter = pkgs.nixfmt-rfc-style;
        devShells.default =
          pkgs.mkShell { packages = [ inputs'.fleet.packages.fleet ]; };
      };

      fleetConfigurations.default = {
        nixpkgs.buildUsing = nixpkgs;

        nixos = { inputs, inputs', ... }: {
          imports = [ ./modules ];
          environment.systemPackages = [ inputs'.pjnvim.packages.nvim ];
          nix.registry.nixpkgs = {
            from = {
              id = "nixpkgs";
              type = "indirect";
            };
            flake = inputs.nixpkgs;
            exact = false;
          };
        };

        hosts = {
          pc-1 = {
            system = "x86_64-linux";
            nixos.imports = [ ./hosts/pc-1/configuration.nix ];
          };
          laptop-t14-g1 = {
            system = "x86_64-linux";
            nixos.imports = [ ./hosts/laptop-t14-g1/configuration.nix ];
          };
        };
      };
    };
}
