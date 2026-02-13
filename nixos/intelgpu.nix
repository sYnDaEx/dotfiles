{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # Voor de 13th Gen i7-1360P
      intel-vaapi-driver
      libvdpau-va-gl
    ];
  };

  # Forceer de Intel driver in de kernel
  boot.initrd.kernelModules = [ "i915" ];
}

