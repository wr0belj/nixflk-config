{ config, pkgs, ... }:

{
  imports = [
    # Import user installed packages.
    ./packages.nix

    # Import colorchemes.
    ./colorschemes/default.nix

    # Import wallpapers.
    ./wallpapers/default.nix

    # Import configs of programs managed by home-manager.
    ./programs/default.nix

    # Import configs of services managed by home-manager.
    ./services/default.nix

    # Import Xorg configuration.
    ./xsession/default.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  manual.json.enable = false;
  manual.html.enable = false;
  manual.manpages.enable = false;

  # Personal information.
  home = {
    username = "wrobelj";
    homeDirectory = "/home/wrobelj";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
