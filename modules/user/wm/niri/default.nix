{ pkgs, inputs, ... }:
{
  imports = [
    inputs.niri.homeModules.default
    ./keybinds.nix
    ./settings.nix
  ];
}
