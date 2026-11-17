{ config, lib, ... }:

{
  options.theme = lib.mkOption {
    type = lib.types.attrs;
    default = { };
  };
  config.fonts.packages = with config.theme.fonts.fonts; [
    dev
    round
  ];
}
