{ config, lib, pkgs, ... }:

{ imports = 
    [ # Installs Gnome 3
      ./gnome3.nix
      # Internationalisation
      ./i18n.nix
      # Users setup
      ./users.nix
    ];

  networking = {
    firewall.enable = true;
    networkmanager.enable = true;
  };

  time.timeZone = "America/Montreal";

  environment.systemPackages = with pkgs; [
    zsh
    curl
    wget
    git
    vim
    links
    w3m
    firefox
    networkmanagerapplet
  ];
  services.nixosManual.showManual = true;

  system.stateVersion = "unstable";
  
  nix = {
    useSandbox = true;
    nixPath = [
      "nixpkgs=https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz"
    ];
  };
}