{ config, pkgs, ... }:

{
  users.mutableUsers = false;
  users.users.adam = {
    isNormalUser = true;
    home = "/home/adam";
    description = "Adam Scott";
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
