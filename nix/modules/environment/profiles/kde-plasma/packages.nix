{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.discover        
    kdePackages.dolphin           
    kdePackages.konsole           
    kdePackages.kate              
    kdePackages.spectacle         
    kdePackages.ark               
    kdePackages.gwenview          
    kdePackages.okular        
    kdePackages.kcalc           
    kdePackages.elisa             
    kdePackages.partitionmanager 
    kdePackages.plasma-systemmonitor 
  ];
}
