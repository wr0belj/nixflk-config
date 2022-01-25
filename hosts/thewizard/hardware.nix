# The hardware specific configuration file.

{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ "${modulesPath}/installer/scan/not-detected.nix" ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # Partitions
  fileSystems = {
    "/" = { 
      device = "/dev/nixos_VG/root";
      fsType = "ext4";
    };
    "/boot" = { 
      device = "/dev/disk/by-label/ESP";
      fsType = "vfat";
    };
  };
  swapDevices = [ 
    {
      device = "/dev/nixosVG/swap";
    }
  ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
