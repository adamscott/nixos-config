{ config, pkgs, ... }:

{ services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    desktopManager.xfce.enable = true;
  };
}
