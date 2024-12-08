{ pkgs, ... }:
let toml = pkgs.formats.toml { };
in {
  environment = {
    systemPackages = with pkgs; [ alacritty ];

    # This still has to be imported manually. There are plans though to support this in upstream Alacritty.
    etc."alacritty/config.toml".source = toml.generate "config.toml" {
      general.import = [ "${pkgs.alacritty-theme}/gruvbox_dark.toml" ];
      window.startup_mode = "Maximized";
      font = {
        normal = {
          family = "MesloLGS Nerd Font";
          style = "Regular";
        };
        size = 14;
      };
      terminal.shell = "${pkgs.zellij}/bin/zellij";
    };
  };
  console.useXkbConfig = true;
}
