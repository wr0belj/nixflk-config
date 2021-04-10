{ config, lib, ... }:
let
  mod = "Mod4";
  term = "alacritty";
in with config; {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;
      fonts = [ "Iosevka 10" ];
      window = {
        titlebar = false;
      };
      gaps.smartBorders = "on";
      floating.titlebar = true;
      keybindings = lib.mkOptionDefault {
         "${mod}+q" = "kill";
         "${mod}+Return" = "exec ${term}";
         "${mod}+Shift+s" = "exec flameshot gui";
         "${mod}+r" = "exec rofi -show drun";
      };
      colors = {
        background = "${colors.background0}";
        focused = {
          border =  "${colors.cyan}";
          childBorder =  "${colors.cyan}";
          background = "${colors.background0}";
          text = "${colors.foreground0}";
          indicator = "${colors.cyanBright}";
        };
        focusedInactive = {
          border =  "${colors.blue}";
          childBorder =  "${colors.cyanBright}";
          background = "${colors.background0}";
          text = "${colors.foreground0}";
          indicator = "${colors.cyanBright}";
        };
        unfocused = {
          border =  "${colors.background0}";
          childBorder =  "${colors.background0}";
          background = "${colors.background0}";
          text = "${colors.foreground0}";
          indicator = "${colors.cyanBright}";
        };
      };
      startup = [
        {
          command = "autorandr -c";
        }
      ];
      bars = [];
    };
  };
}
