{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    oversteer
  ];
}
