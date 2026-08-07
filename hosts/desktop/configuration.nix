{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/clipboard
    ../../modules/system/screenshot
    ../../modules/system/wm
    ../../modules/system/gaming
    ../../modules/system/terminal.nix
    ../../modules/system/texteditor.nix
    ../../modules/system/flatpak.nix
    ../../modules/system/spotify.nix
    ../../modules/system/notifications.nix
    ../../modules/system/video_player.nix
    ../../modules/system/polkit.nix
  ];

  gamingApplications.enable = true;

  services.displayManager.ly.enable = true;

  nixpkgs.config.allowUnfree = true;

  services.tailscale.enable = true;
  
  nixpkgs.overlays = [
    (final: prev: {
      openblas = 
        if prev.stdenv.hostPlatform.system == "i686-linux"
        then prev.openblas.overrideAttrs (_: {doCheck = false;})
        else prev.openblas;
    })
  ];

  hardware.usb-modeswitch.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";
  time.hardwareClockInLocalTime = true;

  fonts = {
    packages = with pkgs; [
      nerd-fonts.caskaydia-mono
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "CaskaydiaMono Nerd Font" ];
	monospace = [ "CaskaydiaMono Nerd Font" ];
	sansSerif = [ "CaskaydiaMono Nerd Font" ];
      };
    };
  };

  users.users.pyric = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" ]; 
    packages = with pkgs; [
      tree
    ];
  };

  programs.gamescope.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #virtualization
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  users.groups.libvirtd.members = [ "pyric" ];
  users.groups.kvm.members = [ "pyric" ];

  environment.systemPackages = with pkgs; [
    gnome-boxes
    dnsmasq
    phodav

    wget
  ];

  system.stateVersion = "26.05"; 
}

