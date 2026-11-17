{
  preset ? "rainbow",
  disks ? [ "/" ],
  # Get with "ip addr"
  networkInterface ? "wlan0",
  ...
}:

{
  programs.hyfetch = {
    enable = true;

    settings = {
      preset = preset;
      mode = "rgb";
      auto_dectect_light_dark = true;
      lightness = 0.6;
      color_align.mode = "horizontal";
      backend = "macchina";
      logo = "default";
      pride_month_disable = false;
    };
  };
  programs.macchina = {
    enable = true;

    settings = {
      theme = "master";
      current_shell = true;
      disks = disks;
      interface = networkInterface;
      disk_space_percentage = true;
      memory_percentage = true;

      show = [
        "Host"
        "Distribution"
        "DesktopEnvironment"
        "WindowManager"
        "Shell"
        "Resolution"
        "Kernel"
        "Packages"
        "LocalIP"
        "Uptime"
        "Processor"
        "ProcessorLoad"
        "Memory"
        "Battery"
        "GPU"
        "DiskSpace"
      ];
    };

    themes.master = {
      bar = {
        visible = true;
        hide_delimiters = false;
        symbol_open = "░";
        glyph = "▒";
        symbol_close = "░";
      };

      box = {
        visible = true;
        title = "♡_♡";
        inner_margin = {
          x = 0;
          y = 0;
        };
        border = "rounded";
      };

      key_color = "orchid";
      keys = {
        de = "Desktop E.";
        wm = "Window M.";
      };
      padding = 2;

      palette = {
        visible = true;
        type = "Full";
      };

      separator = "⟝";
      separator_color = "paleturquoise";
      spacing = 1;
    };
  };
}
