{ config, pkgs, ... }:

let
  trackPointPath = "/sys/devices/platform/i8042/serio1";
in
{ boot.kernelModules = [ "intel_agp" "i915" "tp_smapi" ];
  
  # Add systemd daemon for the TrackPoint setup
  systemd.paths.trackpoint = {
    enable = true;
    description = "TrackPoint attributes watcher";
    pathConfig = {
      PathExists = trackPointPath + "/press_to_select";
    }; 
    wantedBy = [ "default.target" ]; 
  };
  systemd.services.trackpoint = {
    description = "TrackPoint attributes setter";
    serviceConfig = {
      ExecStart = ''
        ${pkgs.bash}/bin/bash -c '\
          echo -n 0 > ${trackPointPath}/press_to_select; \
          echo -n 230 > ${trackPointPath}/speed; \
        '
      '';
    };
  };

  # ThinkPad USB Keyboard with TrackPoint
  # https://github.com/NixOS/nixpkgs/blob/17.03/nixos/modules/services/x11/xserver.nix#L168
  services.xserver.inputClassSections = [ ''
      Identifier      "Trackpoint Wheel Emulation"
      MatchProduct    "ThinkPad USB Keyboard with TrackPoint"
      Option          "EmulateWheel"          "true"
      Option          "EmulateWheelButton"    "2"
      Option          "Emulate3Buttons"       "false"
    '' ];
}
