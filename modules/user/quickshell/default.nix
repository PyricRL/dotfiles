{ pkgs, inputs, ... }:
{
  home.packages = [
    inputs.qml-niri.packages.${pkgs.system}.quickshell
  ];

  systemd.user.services.awww-daemon = {
    Unit = {
      Description = "awww Wallpaper Daemon";
      After = [ "graphical-session-pre.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.awww}/bin/awww-daemon";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
