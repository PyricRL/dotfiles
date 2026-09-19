{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    thunar
    tumbler
    ffmpegthumbnailer
  ];
}
