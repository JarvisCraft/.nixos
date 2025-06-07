{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    fleet = {
      url = "github:CertainLach/fleet";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };
    pjnvim = {
      url = "github:JarvisCraft/pjnvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        git-hooks.follows = "git-hooks";
      };
    };
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs@{
      nixpkgs,
      nixos-hardware,
      flake-parts,
      fleet,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.fleet.flakeModules.default
        inputs.git-hooks.flakeModule
      ];
      systems = [ "x86_64-linux" ];

      perSystem =
        {
          pkgs,
          config,
          inputs',
          ...
        }:
        {
          formatter = pkgs.nixfmt-rfc-style;
          devShells.default = pkgs.mkShellNoCC {
            shellHook = config.pre-commit.installationScript;
            packages = [ inputs'.fleet.packages.fleet ];
          };
          pre-commit.settings.hooks =
            let
              generatedNixFiles = [
                "fleet.nix"
                "hosts/pc-1/hardware-configuration.nix"
                "hosts/laptop-t14-g1/hardware-configuration.nix"
              ];
            in
            {
              nixfmt-rfc-style = {
                enable = true;
                excludes = generatedNixFiles;
              };
              nil.enable = true;
              statix = {
                enable = true;
                settings.ignore = generatedNixFiles;
              };
              flake-checker.enable = true;
              deadnix = {
                enable = true;
                # `settings.exclude` does not work.
                excludes = [ "hardware-configuration.nix" ];
              };
            };
        };

      fleetConfigurations.default = {
        nixpkgs.buildUsing = nixpkgs;

        nixos =
          { inputs, ... }:
          {
            imports = [ ./modules ];
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
            nixos.imports = [
              ./hosts/pc-1/configuration.nix
              ./modules/desktop/obs.nix
              ./modules/virtualisation/virtualbox.nix
              ./modules/steam
            ];
          };
          laptop-t14-g1 = {
            system = "x86_64-linux";
            nixos.imports = [
              ./hosts/laptop-t14-g1/configuration.nix
              nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen1
            ];
          };
        };
      };
    };
}
