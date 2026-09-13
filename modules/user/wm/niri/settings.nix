{ pkgs, ... }:
{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      hotkey-overlay = {
        skip-at-startup = true;
      };
      cursor = {
        theme = "Bibata-Modern-Classic";
        size = 24;
      };
      prefer-no-csd = true;
      layout = {
        background-color = "#00000000";
  
        focus-ring = {
          enable = true;
          width = 2;
          active = {
            color = "0099FF";
          };
          inactive = {
            color = "505050";
          };
        };
        
        gaps = 4;
  
        struts = {
          left = 0;
          right = 0;
          top = 0;
          bottom = 0;
        };
      };
      window-rules = [
        {
          geometry-corner-radius = {
            top-left = 4.0;
            top-right = 4.0;
            bottom-left = 4.0;
            bottom-right = 4.0;
          };
          clip-to-geometry = true;
        }
      ];
      input = {
        mouse = {
          accel-profile = "flat";
          accel-speed = 1.0;
        };
      };
      outputs = {
        "DP-3" = {
          mode = {
            width = 2560;
            height = 1440;
            refresh = 299.999;
          };
          scale = 1.0;
          position = { x = 0; y = 0; };
        };
        "HDMI-A-1" = {
          mode = {
            width = 1920;
            height = 1080;
            refresh = 74.97;
          };
          scale = 1.0;
          position = { x = 2560; y = -420; };
          transform = {
            rotation = 270;
          };
        };
      };
    };
  };
}
