{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    wget
    vim
    links
    mkpasswd

    binutils
    gcc
    gitAndTools.gitFull
    gnumake
    busybox
    pciutils
  ];

  networking = {
    firewall.enable = true;
    networkmanager.enable = true;
  };

  # Support for Fat32
  boot.extraModulePackages = [ config.boot.kernelPackages.exfat-nofuse ];

  services.nixosManual.showManual = true;
}
