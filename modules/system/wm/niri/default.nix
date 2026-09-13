{ pkgs, ... }:
{
  programs.niri.enable = true;

  programs.dms-shell.enable = true;

  services.displayManager.sessionPackages = [ pkgs.niri ];

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}
