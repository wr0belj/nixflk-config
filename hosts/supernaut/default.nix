# The main system configuration file.

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../home.nix
    ];
  
  # Nix config
  nixpkgs.config.allowUnfree = true;

  # Hardware
  hardware = {
    cpu.intel.updateMicrocode = true;
    opengl = {
      driSupport = true;
    };
  };

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd.luks.devices.luksroot = {
      device = "/dev/disk/by-partlabel/nixos";
      preLVM = true;
      allowDiscards = true;
    };
  };

  networking = {
    hostName = "supernaut";
    useDHCP = false;
    interfaces.enp0s31f6.useDHCP = true;
    interfaces.wlan0.useDHCP = true;
    wireless.iwd.enable = true;
  };



  services = {
    xserver = {
      enable = true;
      layout = "pl";
      libinput.enable = true;
      videoDrivers = [ "modesetting" ];
      useGlamor = true;
      displayManager = {
        lightdm.enable = true;
        defaultSession = "xsession";
        autoLogin = {
          enable = true;
          user = "jakubwrobel";
        };
        session = [
	  {
            manage = "desktop";
            name = "xsession";
            start = ''exec $HOME/.xsession'';
          }
        ];
      };
    };
    printing = {
      enable = true;
    };
    gnome3.gnome-keyring.enable = true;
    #udev.extraRules = ''
    #	ACTION=="change", SUBSYSTEM=="drm", RUN+="${/home/jakubwrobel/test/test.sh}", OWNER="jakubwrobel"
    #'';
  };

  # Sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # User account.
  users.users.wrobelj = {
    isNormalUser = true;
    home = "/home/wrobelj";
    description = "Jakub Wrobel";
    extraGroups = [ "wheel" ]; 
  };

  # System packages.
  environment.systemPackages = with pkgs; [
    wget 
    vim
    git
    tree
  ];

  fonts.fonts = with pkgs; [
    iosevka
    font-awesome
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}

