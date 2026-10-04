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

    history = {
      path = "${config.home.homeDirectory}/.zsh_history";
      size = 10000;
      save = 10000;
      share = true;
      ignoreDups = true;
    };

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    completionInit = ''
      zstyle ':completion:*' menu select
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
    '';

    initContent = ''
      eval "$(devenv hook zsh)"
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      add_newline = true;

      format = "$custom$directory$git_branch$git_status$character";

      custom.devenv = {
        command = "echo $DEVENV_NAME";
        when = "test -n \"$DEVENV_NAME\"";
        format = "[$symbol$output]($style) ";
        symbol = "  ";
        style = "bold #ff8700";
      };

      directory = {
        style = "blue";
        truncation_length = 3;
        truncate_to_repo = true;
      };

      git_branch = {
        symbol = " ";
        style = "purple";
      };

      git_status = {
        style = "yellow";
        format = " [$all_status$ahead_behind]($style)";
      };

      character = {
        success_symbol = "[❯](green)";
        error_symbol = "[❯](red)";
      };
    };
  };
}
