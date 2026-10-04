{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    tree-sitter

    # helps with developing
    devenv
    direnv
    nix-direnv
  ];
}
