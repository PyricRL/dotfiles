{ pkgs, ... }:
let
  cliphist-picker = pkgs.writeShellScriptBin "cliphist-picker" (builtins.readFile ./cliphist-fuzzel-img.sh);
in
{
  home.packages = [ cliphist-picker ];
}
