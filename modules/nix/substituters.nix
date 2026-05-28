{
  nix.settings = {
    connect-timeout = 5;
    stalled-download-timeout = 10;
    download-buffer-size = 128 * 1024 * 1024;
    fallback = true;

    substituters = [
      # Mirrors of cache.nixos.org
      "https://mirror.yandex.ru/nixos"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
}
