# ./hosts/proto/sandbox.nix
{ config, pkgs, lib, ... }:

{
  networking.hostName = "sandbox";

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.displayManager.autoLogin = {
    enable = true;
    user = "sandbox"; 
  };

  users.users.sandbox = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    password = "sandbox";
  };
  
  # nix run .#nixosConfigurations.sandbox.config.system.build.vm
  virtualisation.vmVariant = {
    virtualisation.diskSize = 8192;
    virtualisation.memorySize = 4096;
    virtualisation.cores = 4;
  };
  
  # nix run .#nixosConfigurations.sandbox.pkgs.specialisation.gpu.configuration.system.build.vm
  specialisation.gpu.configuration = {
    hardware.graphics.enable = true;
    
    virtualisation.vmVariant = {
      virtualisation.qemu.options = [ 
        "-device virtio-vga-gl" 
        "-display gtk,gl=on" 
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    kdePackages.discover      
    kdePackages.dolphin       
    kdePackages.konsole       
    kdePackages.kate          
    kdePackages.spectacle      
    kdePackages.ark           
    kdePackages.gwenview       
  ];

  services.openssh = {
    enable = true;
  };
}
