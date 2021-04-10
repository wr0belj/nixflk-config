# The configuration file that is common for all of my hosts.
{ config, ... }:
{
  # Time zone.
  time.timeZone = "Europe/Warsaw";

  # Locales
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "pl";
  };
}