# Ad-hoc workarounds for problems blocking work from NixOS machine.
# Eventually and hopefully this should become redundant.
{ pkgs, ... }: {
  # Allow Protobuf Gradle plugin, which unconditionally downloads Proto-binaries, to work.
  #
  # Source: https://discourse.nixos.org/t/protobuf-cant-be-run/13568/8
  # ISSUE: https://github.com/google/protobuf-gradle-plugin/issues/426
  systemd.tmpfiles.rules = [
    "L+ /lib64/ld-linux-x86-64.so.2 - - - - ${pkgs.glibc}/lib64/ld-linux-x86-64.so.2"
  ];
}
