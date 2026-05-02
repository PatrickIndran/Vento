# ./hosts/proto/sandbox.nix
{ config, pkgs, ... }:

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


  virtualisation.vmVariant = {
    virtualisation.memorySize = 4096;
    virtualisation.cores = 4;
    virtualisation.qemu.options = [ 
      "-device virtio-vga-gl" 
      "-display gtk,gl=on" 
    ];
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

}
