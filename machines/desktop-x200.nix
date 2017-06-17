{ config, pkgs, ... }:

{ imports =
    [ # Automatic config
      ../hardware-configuration.nix
      # System base file
      ../config/base.nix
      # Kernel modules and TrackPoint setup
      ../config/x200.nix
    ];

  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/disk/by-id/wwn-0x5000c50024d87fe5";
    useOSProber = true;
  }; 

  networking.hostName = "adam-x200-nixos";
}
