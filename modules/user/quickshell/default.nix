{ pkgs, inputs, ... }:
{
  home.packages = [
    inputs.qml-niri.packages.${pkgs.system}.quickshell
  ];
}
