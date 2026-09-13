{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bibata-cursors
    papirus-icon-theme
    qt6Packages.qt6ct
    mutagen
  ];

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
  };

  xdg.configFile."qt6ct/qt6ct.conf".text = ''
    [Appearance]
    style=Fusion
    icon_theme=Papirus
  '';

  home.sessionVariables = {
    TERMINAL = "alacritty";
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  xdg.configFile."xdg-terminals.list".text = ''
    Alacritty.desktop
  '';
}
