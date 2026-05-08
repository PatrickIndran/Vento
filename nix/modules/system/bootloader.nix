{ config, pkgs, ... }:

{
  # --- Bootloader ---

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # --- Boot ---

  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
  boot.kernelParams = [
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "loglevel=3"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
  ];

  boot.initrd.systemd.enable = true;

  # --- plymouth ---

  boot.plymouth = {
    enable = true;
    theme = "spinner";
    logo = ./../../../src/branding/icons/vento_wordmart/512x512.png;
    
  };

}
