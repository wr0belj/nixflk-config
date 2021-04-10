{ config, pkgs, ... }:
with config; {

  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      i3Support = true;
      pulseSupport = true;
    };
    config = {
      "bar/external" = {
	      monitor = "DP-2-1";
        enable-ipc = true;
        tray-position = "none";
        width = "100%";
        height = 24;
        radius = 0;
        fixed-center = true;

        # Bar colors
        background = "${colors.background1}";
        foreground = "${colors.foreground0}";

        line-size = 3;
        border-size = 0;
        
        # Bar paddings
        padding-left = 2;
        padding-right = 2;

        # Fonts
        font-0 = "Iosevka:style=Medium:pixelsize=10;3";
        font-1 = "Font Awesome 5 Free:style=Solid:pixelsize=9;3";

        # Modules
        modules-left = "i3 title";
        modules-center = "date";
        modules-right = "wireless eth pulseaudio battery";
        # Modules margins
        module-margin-left = 2;
        module-margin-right = 2;
      };

      "bar/internal" = {
	      monitor = "eDP-1";
        enable-ipc = true;
        tray-position = "none";
        width = "100%";
        height = 24;
        radius = 0;
        fixed-center = true;

        # Bar colors
        background = "${colors.background1}";
        foreground = "${colors.foreground0}";

        line-size = 3;
        border-size = 0;
        
        # Bar paddings
        padding-left = 2;
        padding-right = 2;

        # Fonts
        font-0 = "Iosevka:style=Medium:pixelsize=10;3";
        font-1 = "Font Awesome 5 Free:style=Solid:pixelsize=9;3";

        # Modules
        modules-left = "i3 title";
        modules-center = "date";
        modules-right = "wireless eth pulseaudio battery";
        # Modules margins
        module-margin-left = 2;
        module-margin-right = 2;
      };
      
      "module/bspwm" = {
        type = "internal/bspwm";

        label-focused = "%name%";
        label-focused-foreground = "${colors.cyan}";
        label-focused-padding = 1;
        

        label-occupied = "%name%";
        label-occupied-foreground = "${colors.foreground0}";
        label-occupied-padding = 1;

        label-urgent = "%index%!";
        label-urgent-background = "${colors.red}";
        label-urgent-padding = 1;

        label-empty = "" ;
      };

      "module/i3" = {
        type = "internal/i3";
        format = "<label-state> <label-mode>";
        index-sort = true;
        wrapping-scroll = false;
        strip-wsnumbers = false;

        pin-workspaces = true;

        label-mode-padding = 0;
        label-mode-foreground = "${colors.foreground0}";
        label-mode-background = "${colors.cyan}";

        # Active workspace on focused monitor
        label-focused = "%name%";
        label-focused-background = "${colors.background1}";
        label-focused-foreground = "${colors.cyan}";
        label-focused-padding = 1;

        # Inactive workspace on any monitor
        label-unfocused = "%name%";
        label-unfocused-foreground = "${colors.foreground0}";
        label-unfocused-padding = 1;

        # Active workspace on unfocused monitor
        label-visible = "%name%";
        label-visible-background = "${colors.background1}";
        label-visible-foreground = "${colors.blue}";
        label-visible-padding = 1;

        # Workspace with urgency hint set
        label-urgent = "%name%";
        label-urgent-background = "${colors.red}";
        label-urgent-padding = 1;
      };

      "module/title" = {
        type = "internal/xwindow";
        format = "<label>";
        format-foreground = "${colors.blue}";
        format-padding = 0;

        label = "%title%";
        label-maxlen = 60;

        label-empty = "";
      };

      "module/wireless" = {
        type = "internal/network";
        interface = "wlan0";
        interval = "3.0";

        # The connected state
        format-connected-prefix = " ";
        format-connected-prefix-foreground = "${colors.cyan}";
        label-connected = "%essid%";

        # The disconnected state
        format-disconnected = "";
        label-disconnected = "%ifname% disconnected";
        label-disconnected-foreground = "${colors.foreground0}";
      };

      "module/eth" = { 
        type = "internal/network";
        interface = "enp0s31f6";
        interval = "3.0";

        # The connected state
        format-connected-prefix = " ";
        format-connected-prefix-foreground = "${colors.cyan}";
        label-connected = "connected";

        # The disconnected state
        format-disconnected = "";
      };

      "module/date" = {
        type = "internal/date";
        interval = 5;

        date = "%a";
        date-alt = " %Y-%m-%d";

        time = "%H:%M";
        time-alt = "%H:%M:%S";

        label = "%date% %time%";
      };

      "module/battery" = {
        type = "internal/battery";
        battery = "BAT1";
        adapter = "AC";
        full-at = 96;

        # Charging state
        format-charging = "<animation-charging> <label-charging>";
        animation-charging-foreground = "${colors.cyan}";
        # Charging animation
        animation-charging-0 = "";
        animation-charging-1 = "";
        animation-charging-2 = "";
        animation-charging-3 = "";
        animation-charging-4 = "";

        # Discharging state
        format-discharging = "<ramp-capacity> <label-discharging>";
        # Discharging animation
        ramp-capacity-foreground = "${colors.cyan}";
        ramp-capacity-0 = "";
        ramp-capacity-1 = "";
        ramp-capacity-2 = "";
        ramp-capacity-3 = "";
        ramp-capacity-4 = "";

        # Full state
        format-full-prefix = " ";
        format-full-prefix-foreground = "${colors.cyan}";
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";

        # Unmuted state
        format-volume = "<ramp-volume> <label-volume>";
        # Volume indictator
        ramp-volume-foreground = "${colors.cyan}";
        ramp-volume-0 = "";
        ramp-volume-1 = "";
        ramp-volume-2 = "";

        # Muted state
        format-muted-prefix = " ";
        format-muted-prefix-foreground = "${colors.cyan}";
        label-muted = "muted";
      };

      "global/wm" = {
        margin-top = 0;
        margin-bottom = 0;
      };
    };
    script = "";
  };
}
