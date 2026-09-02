{ pkgs, ... }:
{
  home.packages = with pkgs; [
    librewolf
    chromium
  ];
}
