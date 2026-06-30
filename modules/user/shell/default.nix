{ config, pkgs, ... }:

let
  myAliases = {
    ll = "ls -l";
    ".." = "cd ..";
  };
in
{
  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };
  
  programs.starship = {
    enable = false;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
    };
  };
}
