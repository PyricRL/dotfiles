{ pkgs, inputs, ... }:
{
  imports = [
    inputs.niri.homeModules.niri
    ./keybinds.nix
    ./settings.nix
  ];
}
