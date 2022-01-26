{ pkgs, ... }:
{
    home.packages = with pkgs; [
        tdesktop
        pavucontrol
        #flameshot
        pfetch
        feh
        psmisc
        gnome3.adwaita-icon-theme
        google-chrome
        discord
        inkscape
        maim
        xclip
    ];
}