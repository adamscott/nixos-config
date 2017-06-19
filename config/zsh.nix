{ config, lib, pkgs, ... }:

{ programs.zsh.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";
}
