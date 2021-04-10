{ config, ... }:
with config; {
  programs.alacritty = {
    enable = true;
    settings = {
      font.normal.family = "Iosevka";
      window.padding = {
        x = 20;
        y = 5;
      };
      colors = {
        primary = {
          background = "${colors.background0}";
          foreground = "${colors.foreground0}";
        };
        cursor = {
          text = "${colors.background0}";
          cursor = "${colors.foreground0}";
        };
        vi_mode_cursor = {
          text = "${colors.background0}";
          cursor = "${colors.foreground0}";
        };
        selection = {
          text = "CellForeground";
          background = "${colors.background3}";
        };
        search = {
          matches = {
            foreground = "CellBackground";
            background = "${colors.cyan}";
          };
          bar = {
            background = "${colors.background2}";
            foreground = "${colors.foreground0}";
          };
        };
        normal = {
          black = "${colors.black}";
          red = "${colors.red}";
          green = "${colors.green}";
          yellow = "${colors.yellow}";
          blue = "${colors.blue}";
          magenta = "${colors.magenta}";
          cyan = "${colors.cyan}";
          white = "${colors.white}";
        };
        bright = {
          black = "${colors.blackBright}";
          red = "${colors.redBright}";
          green = "${colors.greenBright}";
          yellow = "${colors.yellowBright}";
          blue = "${colors.blueBright}";
          magenta = "${colors.magentaBright}";
          cyan = "${colors.cyanBright}";
          white = "${colors.whiteBright}";
        };
      };
    };
  };
}
