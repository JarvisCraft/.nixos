{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hunspell
    hunspellDicts.en-us-large
    hunspellDicts.ru-ru
  ];
}
