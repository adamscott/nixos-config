{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    firefox
    libreoffice-still

    aspell
    aspellDicts.en
    aspellDicts.fr
  ];

  sound.enable = true;
}
