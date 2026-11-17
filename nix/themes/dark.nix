{ pkgs, ... }:

{
  config.theme = {
    fonts = {
      fonts = with pkgs; {
        dev = jetbrains-mono;
        round = sn-pro;
      };
      sizes = {
        default = 0;
      };
    };

    grub = {
      font = "${pkgs.sn-pro}/fonts/ttf/SNPro-Medium.ttf";
      fontSize = 18;
    };

    zed = {
      extensions = [
        "colorizer"
        "material icon theme"
      ];
      icon_theme = {
        mode = "dark";
        light = "Zed (Default)";
        dark = "Material Icon Theme";
      };
      theme = {
        mode = "dark";
        light = "Ayu Light";
        dark = "Colorizer Pro";
      };
    };

    firefox = {

    };
  };
}
