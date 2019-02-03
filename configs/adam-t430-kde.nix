{ config, pkgs, ... }:

{
  imports = [
    <nixos-hardware/lenovo/thinkpad/t430>
    ../../hardware-configuration.nix
    ../hardware/adam-t430.nix
    ../common/desktops/kde
    ../common/shells/fish
    ../common/external-hardware/wacom
  ];

  services.xserver.layout = "ca";

  i18n = {
    consoleFont = "Lat9w-16";
    consoleKeyMap = "cf";
    defaultLocale = "fr_CA.UTF-8";
  };

  time.timeZone = "America/Toronto";

  environment.variables = {
    EDITOR = "vim";
    SUDO_EDITOR = "vim";
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  nix.useSandbox = true;

  system.stateVersion = "18.09";
}
