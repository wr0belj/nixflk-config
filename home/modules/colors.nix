{ lib, ... }:

with lib;

{
  options.colors =
    let
      mkColorOption = name: {
        inherit name;
        value = mkOption {
          type = types.strMatching "#[a-fA-F0-9]{6}";
          description = "Color ${name}.";
        };
      };
    in
      listToAttrs (map mkColorOption [
        "background0" "background1" "background2" "background3"
        "foreground0" "foreground1" "foreground2"
        "black" "blackBright"
        "red" "redBright"
        "green" "greenBright"
        "yellow" "yellowBright"
        "blue" "blueBright"
        "magenta" "magentaBright"
        "cyan" "cyanBright"
        "white" "whiteBright"
      ]);
}