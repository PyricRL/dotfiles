{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.oshot.packages.${pkgs.system}.default
    pkgs.grim
    pkgs.slurp
    pkgs.zenity
  ];
}
