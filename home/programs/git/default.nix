{ pkgs, ... }:
with pkgs; {
  programs.git = {
    enable = true;
    userName  = "Jakub Wróbel";
    userEmail = "40501814+wrobeljakub@users.noreply.github.com";
    extraConfig = {
      credential.helper = "${git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
    };
  };
}