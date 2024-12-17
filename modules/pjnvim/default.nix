{ lib, inputs', ... }:
let
  pjnvim = inputs'.pjnvim.packages.editor;
in
{
  environment = {
    systemPackages = [ pjnvim ];
    variables.EDITOR = lib.mkOverride 900 "${pjnvim}/bin/nvim";
  };
}
