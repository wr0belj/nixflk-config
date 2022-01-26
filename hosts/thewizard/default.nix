# The main system configuration file.

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware.nix
      ../home.nix
    ];
  
  # Nix config
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
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
      device = "/dev/disk/by-partlabel/nixos_luks";
      preLVM = true;
      allowDiscards = true;
    };
  };

  networking = {
    hostName = "thewizard";
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
          user = "wr0belj";
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
    gnome.gnome-keyring.enable = true;
  };

  # Sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # User account.
  users.users.wr0belj = {
    isNormalUser = true;
    home = "/home/wr0belj";
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

