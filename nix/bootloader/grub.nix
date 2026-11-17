{ config, ... }:

{
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = false;
      device = "/dev/vda";

      font = config.theme.grub.font;
      fontSize = config.theme.grub.fontSize;
    };
  };
}
