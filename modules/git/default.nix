{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    config = {
      init.defaultBranch = "master";
      core = {
        editor = "nvim";
        autocrlf = "input";
      };

      commit.gpgsign = true;
    };
  };

  environment.defaultPackages = with pkgs; [
    gitoxide
    gh
  ];
}
