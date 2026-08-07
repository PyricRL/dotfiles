{ config, pkgs, ... }: 
{
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "super+q".action = close-window;
    "super+b".action = spawn "${pkgs.librewolf}/bin/librewolf";
    "super+Return".action = spawn "${pkgs.alacritty}/bin/alacritty";
    "super+f".action = fullscreen-window;

    "super+e".action = spawn "${pkgs.thunar}/bin/thunar";
    "super+t".action = toggle-window-floating;

    "super+shift+s".action = spawn "bash" "-c" ''
      ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.wl-clipboard}/bin/wl-copy
    '';

    "super+space".action = spawn "${pkgs.wofi}/bin/wofi" "--show" "drun";

    # screen recording
    "super+equal".action = spawn "/home/pyric/.dotfiles/modules/system/gaming/scripts/capture-replay.sh";
    "super+minus".action = spawn "/home/pyric/.dotfiles/modules/system/gaming/scripts/start-replay-buffer.sh";
    "super+0".action = spawn "/home/pyric/.dotfiles/modules/system/gaming/scripts/close-replay-buffer.sh";

    # quickshell stuff
    "super+n".action = spawn "qs" "ipc" "call" "shell" "toggleNotifications";
    "super+p".action = spawn "qs" "ipc" "call" "shell" "togglePower";

    "super+h".action = focus-column-left;
    "super+l".action = focus-column-right;
    "super+k".action = focus-workspace-up;
    "super+j".action = focus-workspace-down;

    "super+Shift+h".action = move-column-left;
    "super+Shift+l".action = move-column-right;
    "super+Shift+k".action = move-column-to-workspace-up;
    "super+Shift+j".action = move-column-to-workspace-down;
    
    "super+ctrl+h".action = focus-monitor-left;
    "super+ctrl+l".action = focus-monitor-right;

    "super+1".action = focus-workspace 1;
    "super+2".action = focus-workspace 2;
    "super+3".action = focus-workspace 3;
    "super+4".action = focus-workspace 4;
  };
}
