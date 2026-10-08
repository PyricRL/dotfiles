{ config, pkgs, ... }:
{
  wayland.windowManager.niri.settings.binds = {
    "Mod+Q" = {
      close-window = [ ];
    };

    "Mod+B" = {
      spawn = "${pkgs.librewolf}/bin/librewolf";
    };

    "Mod+Return" = {
      spawn = "${pkgs.alacritty}/bin/alacritty";
    };

    "Mod+F" = {
      fullscreen-window = [ ];
    };

    "Mod+E" = {
      spawn = "${pkgs.thunar}/bin/thunar";
    };

    "Mod+T" = {
      toggle-window-floating = [ ];
    };

    "Mod+Shift+S" = {
      spawn = [
        "oshot"
        "--gui"
      ];
    };

    "Mod+S" = {
      spawn = [
        "oshot"
        "--instant-copy"
        "--gui"
      ];
    };

    "XF86AudioNext" = {
      spawn = [
        "${pkgs.playerctl}/bin/playerctl"
        "next"
      ];
    };

    "XF86AudioPrev" = {
      spawn = [
        "${pkgs.playerctl}/bin/playerctl"
        "previous"
      ];
    };

    "XF86AudioPlay" = {
      spawn = [
        "${pkgs.playerctl}/bin/playerctl"
        "play-pause"
      ];
    };

    "Mod+equal" = {
      spawn = [
        "${config.home.homeDirectory}/.dotfiles/nix/modules/system/gaming/scripts/capture-replay.sh"
      ];
    };

    "Mod+0" = {
      spawn = [
        "${config.home.homeDirectory}/.dotfiles/nix/modules/system/gaming/scripts/start-replay-buffer.sh"
      ];
    };

    "Mod+minus" = {
      spawn = [
        "${config.home.homeDirectory}/.dotfiles/nix/modules/system/gaming/scripts/close-replay-buffer.sh"
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
        "qs"
        "ipc"
        "call"
        "shell"
        "clipboard"
      ];
    };

    "Mod+N" = {
      spawn = [
        "qs"
        "ipc"
        "call"
        "shell"
        "toggleRightMenu"
      ];
    };

    "Mod+H" = {
      focus-column-left = [ ];
    };

    "Mod+L" = {
      focus-column-right = [ ];
    };

    "Mod+K" = {
      focus-workspace-up = [ ];
    };

    "Mod+J" = {
      focus-workspace-down = [ ];
    };

    "Mod+Shift+H" = {
      move-column-left = [ ];
    };

    "Mod+Shift+L" = {
      move-column-right = [ ];
    };

    "Mod+Shift+K" = {
      move-column-to-workspace-up = [ ];
    };

    "Mod+Shift+J" = {
      move-column-to-workspace-down = [ ];
    };

    "Mod+Ctrl+H" = {
      focus-monitor-left = [ ];
    };

    "Mod+Ctrl+L" = {
      focus-monitor-right = [ ];
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
