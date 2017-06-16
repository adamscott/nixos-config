{ config, lib, pkgs, ... }:

{ i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "cf";
    defaultLocale = "fr_CA.UTF-8";
  };

  services.xserver.layout = "ca";
}