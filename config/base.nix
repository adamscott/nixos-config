{ config, lib, pkgs, ... }:

{ imports = 
    [ # Installs Desktop Manager
      ./gnome3.nix
      # Internationalisation
      ./i18n.nix
      # Users setup
      ./users.nix
      # zsh shell
      ./zsh.nix
    ];
  
  networking = 
    { firewall.enable = true;
      networkmanager.enable = true;
    };

  time.timeZone = "America/Montreal";

  environment.systemPackages = 
    with pkgs; [
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

  system = 
    { autoUpgrade = 
        { enable = true;
          channel = "https://nixos.org/channels/nixos-unstable/";
        };
      stateVersion = "unstable";
    };  

  nix.useSandbox = true;

  nixpkgs.config = import ./nixpkgs.nix; 
}
