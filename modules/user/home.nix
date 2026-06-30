{ config, pkgs, ... }:
{
  imports = [
    ./browser
    ./clipboard
    ./gaming
    ./shell
    ./vesktop
    ./wm
  ];

  home.username = "pyric";
  home.homeDirectory = "/home/pyric";

  home.stateVersion = "26.05"; # Please read the comment before changing.

  home.sessionVariables = {
    EDITOR = "neovim";
  };

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

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Pyric";
	email = "ljcosa@icloud.com";
      };
    };
  };
}
