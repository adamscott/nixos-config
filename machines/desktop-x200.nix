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

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/93E8-7930";
    fsType = "vfat";
  };

  networking.hostName = "adam-x200-nixos";
  
}
