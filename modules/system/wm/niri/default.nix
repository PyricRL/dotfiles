{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    niri
  ];

  services.displayManager.sessionPackages = [ pkgs.niri ];
}
