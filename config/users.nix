{ config, pkgs, ... }:

{ users.mutableUsers = false;
  users.extraUsers.adam = 
    { isNormalUser = true;
      home = "/home/adam";
      description = "Adam Scott";
      extraGroups = [ "wheel" "networkmanager" ];
    };
}
