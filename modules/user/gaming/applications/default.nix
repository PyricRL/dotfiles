{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    oversteer
    xremap
  ];

  xdg.configFile."xremap/config.yml".text = ''
    modmap:
      - name: Global
        remap:
          CapsLock: Grave
  '';

  systemd.user.services.xremap = {
    Unit = {
      Description = "xremap";
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.xremap}/bin/xremap --watch=config ${config.xdg.configHome}/xremap/config.yml --mouse";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
