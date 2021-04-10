{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    userSettings = {

    };
    extensions = with pkgs.vscode-extensions; [
      bbenoist.Nix
    ];
  };
}
