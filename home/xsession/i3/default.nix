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
         "${mod}+Shift+s" = "exec maim -s | xclip -selection clipboard -t image/png";
         "${mod}+r" = "exec rofi -show drun";
      };
      colors = {
        background = "${colors.background0}";
        focused = {
          border =  "${colors.magenta}";
          childBorder =  "${colors.magenta}";
          background = "${colors.background0}";
          text = "${colors.foreground0}";
          indicator = "${colors.magentaBright}";
        };
        focusedInactive = {
          border =  "${colors.blue}";
          childBorder =  "${colors.magentaBright}";
          background = "${colors.background0}";
          text = "${colors.foreground0}";
          indicator = "${colors.magentaBright}";
        };
        unfocused = {
          border =  "${colors.background0}";
          childBorder =  "${colors.background0}";
          background = "${colors.background0}";
          text = "${colors.foreground0}";
          indicator = "${colors.magentaBright}";
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
