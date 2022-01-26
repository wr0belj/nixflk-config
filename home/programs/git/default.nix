{ pkgs, ... }:
with pkgs; {
  programs.git = {
    enable = true;
    userName  = "wr0belj";
    userEmail = "wr00belj@gmail.com";
  };
}
