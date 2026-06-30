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
  ];

  gamingApplications.enable = true;

  services.displayManager.ly.enable = true;

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (final: prev: {
      openblas = 
        if prev.stdenv.hostPlatform.system == "i686-linux"
        then prev.openblas.overrideAttrs (_: {doCheck = false;})
        else prev.openblas;
    })
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

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
    extraGroups = [ "wheel" ]; 
    packages = with pkgs; [
      tree
    ];
  };

  programs.gamescope.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    wget
    fuzzel
    librewolf
  ];

  system.stateVersion = "26.05"; 
}

