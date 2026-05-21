{ pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;

    direnvrcExtra = ''
      # Save original use_flake from nix-direnv
      eval "$(declare -f use_flake | sed '1s/^use_flake /__nix_direnv_use_flake /')"

      # Override use_flake to show nvd diff after updates
      use_flake() {
        local layout_dir old_profile=""
        layout_dir=$(direnv_layout_dir)

        local old_files=("$layout_dir"/flake-profile-*)
        if [ ''${#old_files[@]} -gt 0 ] && [ -e "''${old_files[0]}" ]; then
          old_profile=$(readlink -f "''${old_files[0]}") || old_profile=""
        fi

        __nix_direnv_use_flake "$@"

        local new_profile=""
        local new_files=("$layout_dir"/flake-profile-*)
        if [ ''${#new_files[@]} -gt 0 ] && [ -e "''${new_files[0]}" ]; then
          new_profile=$(readlink -f "''${new_files[0]}") || new_profile=""
        fi

        if [ -n "$old_profile" ] && [ -n "$new_profile" ] && [ "$old_profile" != "$new_profile" ]; then
          echo ""
          echo "=== Nix store diff ==="
          ${pkgs.nvd}/bin/nvd diff "$old_profile" "$new_profile"
        fi
      }
    '';
  };
}
