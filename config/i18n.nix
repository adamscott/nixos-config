{ config, lib, pkgs, ... }:

{ imports = 
    [ ../options/xkb.nix
      ../options/localectl-fix.nix
    ];

  i18n = 
    { consoleFont = "Lat2-Terminus16";
      consoleKeyMap = "cf";
      defaultLocale = "fr_CA.UTF-8";
    };

  services.xserver.layout = "ca";
  services.xserver.localectlFix.enable = true;
}
