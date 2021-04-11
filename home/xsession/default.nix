{ config, pkgs, ... }:
{
  imports = [
      ./i3/default.nix
  ];
  xsession = {
    enable = true;
    pointerCursor = {
      package = pkgs.gnome3.adwaita-icon-theme;
      name = "Adwaita";
      size = 16;
    };
  };
}
