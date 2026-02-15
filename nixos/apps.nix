{ pkgs, ... }:

{
  # Nodig voor Chrome en Brave
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    localsend
    micro
    google-chrome
    brave
    vlc
    chromium
    github-cli
    podman
    distrobox
    zed-editor
  ];

  # Poorten voor LocalSend
  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 53317 ];

  # Flatpak voor eventuele andere browsers zoals Zen
  services.flatpak.enable = true;
}
