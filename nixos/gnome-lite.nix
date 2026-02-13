{ config, pkgs, ... }:

{
  environment.gnome.excludePackages = with pkgs; [
    # De "Niet-nodig" apps
    geary
    gnome-weather
    gnome-maps
    gnome-music
    gnome-contacts
    gnome-calendar
    gnome-clocks
    gnome-software
    
    # Systeem tools
    gnome-tour
    yelp
    gnome-logs
    # gnome-font-viewer
    gnome-characters
    baobab
    
    # Media & Browsing
    # epiphany
    totem
    snapshot
    loupe
    
    # Games
    tali 
    iagno 
    hitori 
    atomix
  ];
}
