{ config, lib, pkgs, ... }:

with lib;
{ services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome3.enable = true;
    desktopManager.gnome3.extraGSettingsOverrides = ''
      [org.gnome.desktop.input-sources]
      sources=[('xkb','${config.services.xserver.layout + (optionalString (config.services.xserver.xkbVariant != "") ("+" + config.services.xserver.xkbVariant))}')]
    '';
  };
}
