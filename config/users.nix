{ config, pkgs, ... }:

{ users.mutableUsers = false;
  users.extraUsers.adam = 
    { isNormalUser = true;
      home = "/home/adam";
      description = "Adam Scott";
      extraGroups = [ "wheel" "networkmanager" ];
      hashedPassword = "$6$Fq8kOD2XUTuv1cu$WakOdJEUkaIuN8smk6u5S9OxHGHeZ.zpTplaZtiO8FdVHdk2pgEdbAm4IuWxWR6yrg.yr9f3tURbjg9lJaiwL0";
    };
}
