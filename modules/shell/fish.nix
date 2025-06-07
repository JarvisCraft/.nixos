{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      tide configure --auto \
        --style=Rainbow \
        --prompt_colors='True color' \
        --show_time='24-hour format' \
        --rainbow_prompt_separators=Round \
        --powerline_prompt_heads=Round \
        --powerline_prompt_tails=Round \
        --powerline_prompt_style='Two lines, character and frame' \
        --prompt_connection=Solid \
        --powerline_right_prompt_frame=No \
        --prompt_connection_andor_frame_color=Dark \
        --prompt_spacing=Sparse --icons='Many icons' \
        --transient=No
    '';
  };

  environment.systemPackages = with pkgs.fishPlugins; [
    tide
    gruvbox
    colored-man-pages
    done
    pisces
  ];
}
