{ config, pkgs, ... }:

{
  users.mutableUsers = false;
  users.users.adam = {
    isNormalUser = true;
    home = "/home/adam";
    description = "Adam Scott";
    extraGroups = [ "wheel" "networkmanager" ];
    hashedPassword = "$6$sx.cOyl6MM$RCagTJvR09Dm4JBgRgcpo5fStp7TtOuIBL7QPNQSlZLaB5wQ86g24RhM0xyPlc9K4c0AFdCrumYReoo0AALgK1";
  };
}
