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
    pciutils
  ];

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts
    dina-font
    proggyfonts
  ];

  # Steam support
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  networking = {
    firewall.enable = true;
    networkmanager.enable = true;
  };

  # Support for Fat32
  boot.extraModulePackages = [ config.boot.kernelPackages.exfat-nofuse ];

  services.nixosManual.showManual = true;
}
