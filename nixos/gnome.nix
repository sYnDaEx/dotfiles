{ pkgs, ... }:

{
  # Nodig voor Chrome en Brave
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    gnome-menus
    gnomeExtensions.blur-my-shell   # Voor die mooie transparante/blur effecten
    gnomeExtensions.dash-to-panel    # Voor een dock die je naar wens kunt stylen
    gnomeExtensions.appindicator
    gnomeExtensions.arc-menu
    libgtop
  ];
