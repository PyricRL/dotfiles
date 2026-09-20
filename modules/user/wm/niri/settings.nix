{ pkgs, ... }:
{
  wayland.windowManager.niri = {
    enable = true;
    package = pkgs.niri;

    settings = {
      hotkey-overlay = {
        skip-at-startup = true;
      };

      prefer-no-csd = true;

      layout = {
        background-color = "#00000000";
        gaps = 4;

        struts = {
          left = 0;
          right = 0;
          top = 0;
          bottom = 0;
        };
      };

      window-rule = [
        {
          opacity = 0.8;
        }
        {
          match = {
            _props.app-id._raw = ''r#"^librewolf$"#'';
          };

          opacity = 1.0;
        }
        {
          geometry-corner-radius._args = [ 6.0 ];

          clip-to-geometry = true;

          focus-ring._children = [
            { width = 1; }
          ];
        }
        {
          match = {
            _props.app-id._raw = ''r#"^Alacritty$"#'';
          };

          background-effect = {
            blur = true;
          };
        }
      ];

      input.mouse = {
        accel-profile = "flat";
        accel-speed = 1.0;
      };

      output = [
        {
          _args = [ "DP-3" ];
          mode = "2560x1440@299.999";
          scale = 1.0;

          position._props = {
            x = 0;
            y = 0;
          };
        }

        {
          _args = [ "HDMI-A-1" ];
          mode = "1920x1080@74.97";
          scale = 1.0;

          position._props = {
            x = 2560;
            y = -420;
          };

          transform._args = [ "270" ];
        }
      ];
    };
  };
}

