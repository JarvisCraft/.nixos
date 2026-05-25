{
  nix.settings = {
    connect-timeout = 5;
    stalled-download-timeout = 10;
    download-buffer-size = 128 * 1024 * 1024;

    substituters = [
      # Mirror of cache.nixos.org
      "https://mirror.yandex.ru/nixos"
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
}
