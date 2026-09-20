{ pkgs, ... }:
{
  wayland.windowManager.niri.settings.binds = {
    "Mod+Q" = {
      close-window = [];
    };

    "Mod+B" = {
      spawn = "${pkgs.librewolf}/bin/librewolf";
    };

    "Mod+Return" = {
      spawn = "${pkgs.alacritty}/bin/alacritty";
    };

    "Mod+F" = {
      fullscreen-window = [];
    };

    "Mod+E" = {
      spawn = "${pkgs.thunar}/bin/thunar";
    };

    "Mod+T" = {
      toggle-window-floating = [];
    };

    "Mod+Shift+S" = {
      spawn = "oshot";
    };

    "Mod+S" = {
      spawn = [
        "oshot"
        "--instant-copy"
      ];
    };

    "Mod+Space" = {
      spawn = [
        "qs"
        "ipc"
        "call"
        "shell"
        "toggleLauncher"
      ];
    };

    "Mod+V" = {
      spawn = [
        "dms"
        "ipc"
        "call"
        "clipboard"
        "toggle"
      ];
    };

    "Mod+H" = {
      focus-column-left = [];
    };

    "Mod+L" = {
      focus-column-right = [];
    };

    "Mod+K" = {
      focus-workspace-up = [];
    };

    "Mod+J" = {
      focus-workspace-down = [];
    };

    "Mod+Shift+H" = {
      move-column-left = [];
    };

    "Mod+Shift+L" = {
      move-column-right = [];
    };

    "Mod+Shift+K" = {
      move-column-to-workspace-up = [];
    };

    "Mod+Shift+J" = {
      move-column-to-workspace-down = [];
    };

    "Mod+Ctrl+H" = {
      focus-monitor-left = [];
    };

    "Mod+Ctrl+L" = {
      focus-monitor-right = [];
    };

    "Mod+1" = {
      focus-workspace = 1;
    };

    "Mod+2" = {
      focus-workspace = 2;
    };

    "Mod+3" = {
      focus-workspace = 3;
    };

    "Mod+4" = {
      focus-workspace = 4;
    };
  };
}

