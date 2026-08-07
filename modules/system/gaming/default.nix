{ lib, config, pkgs, ... }:
{
  imports = [
    ./recording.nix
    ./btop.nix
  ];

  options.gamingApplications.enable = lib.mkEnableOption "Enable gaming applications";

  config = lib.mkIf config.gamingApplications.enable {
    boot.extraModulePackages = with config.boot.kernelPackages; [
      new-lg4ff
    ];
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    programs.gamescope = {
      enable = true;
    };

    programs.gamemode.enable = true;
    
    environment.systemPackages = with pkgs; [
      heroic
      prismlauncher
      mangohud
    ];

    services.udev.packages = with pkgs; [
      oversteer
    ];

    services.input-remapper.enable = true;
  };
}
