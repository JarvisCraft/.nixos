# Ad-hoc workarounds for problems blocking work from NixOS machine.
# Eventually and hopefully this should become redundant.
{
  # Allow Protobuf Gradle plugin, which unconditionally downloads Proto-binaries, to work.
  programs.nix-ld.enable = true;
}
