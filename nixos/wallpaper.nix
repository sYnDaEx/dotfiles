{ config, pkgs, ... }:

let
  # We maken het script direct in Nix
  wallpaperScript = pkgs.writeShellScriptBin "change_wallpaper" ''
    DIR="/home/sakurax/Pictures/wallpapers"
    if [ -d "$DIR" ] && [ "$(ls -A $DIR)" ]; then
      PIC=$(find "$DIR" -type f | shuf -n1)
      ${pkgs.glib}/bin/gsettings set org.gnome.desktop.background picture-uri-dark "file://$PIC"
    fi
  '';
in
{
  # Voeg het script toe aan je systeem
  environment.systemPackages = [ wallpaperScript ];

  # De Timer en Service
  systemd.user.services.wallpaper-changer = {
    description = "Wisselt de OLED wallpaper";
    serviceConfig.ExecStart = "${wallpaperScript}/bin/change_wallpaper";
  };

  systemd.user.timers.wallpaper-changer = {
    description = "Wissel elke 30 minuten de wallpaper";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "2m";
      OnUnitActiveSec = "30m";
      Unit = "wallpaper-changer.service";
    };
  };
}
