{ config, pkgs, ... }:
{
  imports = [
    ./browser
    ./clipboard
    ./gaming
    ./shell
    ./vesktop
    ./wm
    ./editor
    ./quickshell
    ./wallpaper.nix
  ];

  home.username = "pyric";
  home.homeDirectory = "/home/pyric";

  home.stateVersion = "26.05"; # Please read the comment before changing.

  services.cliphist = {
    enable = true;
    systemdTargets = [ "default.target" ];
    allowImages = true;
  };

  systemd.user.services.cliphist = {
    Service = {
      RestartSec = 3;
    };
  };

  programs.home-manager = {
    enable = true;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
      "x-scheme-handler/spotify" = "spotify.desktop";
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Pyric";
        email = "temp@example.com";
      };
    };
  };
}
