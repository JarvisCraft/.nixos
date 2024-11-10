{
  time.timeZone = "Europe/Moscow";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings =
      let
        ru = "ru_RU.UTF-8";
      in
      {
        LC_ADDRESS = ru;
        LC_IDENTIFICATION = ru;
        LC_MEASUREMENT = ru;
        LC_MONETARY = ru;
        LC_NAME = ru;
        LC_NUMERIC = ru;
        LC_PAPER = ru;
        LC_TELEPHONE = ru;
        LC_TIME = ru;
      };
  };

  services.xserver = {
    xkb.layout = "us,ru";
    xkb.options = "grp:alt_shift_toggle";
  };
}
