{
  programs.autorandr = {
    enable = true;
    profiles = {
      "docked" = {
        fingerprint = {
          DP-2-1 = "00ffffffffffff00410c55c1474e0000181d010380351e782a0565a756529c270f5054bfef00d1c0b30095008180814081c001010101023a801871382d40582c45000f282100001e000000fd00324c1e5311000a202020202020000000fc0050484c2032343356370a202020000000ff00554b30313932343032303033390056";
        };
        config = {
          eDP-1.enable = false;
          DP-2-1 = {
            enable = true;
            mode = "1920x1080";
          };
        };
        hooks.postswitch = builtins.readFile ./scripts/postswitch/docked.sh;
      };
      "mobile" = {
        fingerprint = {
          eDP-1 = "00ffffffffffff0006af3c2e0000000000170104951f117802bbf5945554902723505400000001010101010101010101010101010101ce1d56e250001e302616360035ad100000180000000f0000000000000000000000000020000000fe0041554f0a202020202020202020000000fe004231343058544e30322e45200a00ca";
        };
        config = {
          eDP-1 = {
            enable = true;
            mode = "1366x768";
          };
          DP-2-1.enable = false;
        };
        hooks.postswitch = builtins.readFile ./scripts/postswitch/mobile.sh;
      };
    };
  };
}
