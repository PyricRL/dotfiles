{ lib, config, pkgs, ... }:
{
  options.gamingApplications.enable = lib.mkEnableOption "Enable gaming applications";

  config = lib.mkIf config.gamingApplications.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    programs.gamescope = {
      enable = true;
      args = [
        "--fps-limit=180"
      ];
      capSysNice = true;
    };

    programs.gamemode.enable = true;
    
    environment.systemPackages = with pkgs; [
      heroic
      prismlauncher
      mangohud
    ];
  };
}
