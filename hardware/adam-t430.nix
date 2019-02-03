{ config, pkgs, ... }:

{
  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  # Systemd Boot
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/disk/by-uuid/3470aad2-abb1-4b72-b6d2-9dd47ff13af6";
      preLVM = true;
      allowDiscards = true;
    }
  ];

  networking.hostName = "adam-t430-nixos";
}
