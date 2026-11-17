{
  lib,
  languages ? [ ],
  ...
}:

{
  programs.zed-editor = {
    enable = true;
    defaultEditor = true;

    extensions =
      [ ]
      # Nix
      ++ lib.optional (builtins.elem "nix" languages) "nix"
      # Rust
      ++ lib.optionals (builtins.elem "rust" languages) [
        "toml"
        "tombi"
      ]
      ++ lib.optional (builtins.elem "wgsl" languages) "wgsl"
      # Git
      ++ lib.optional (builtins.elem "git" languages) "git firely"
      # json & co
      ++ lib.optional (builtins.elem "md" languages) "markdown oxide"
    #++ theme.zed.extensions
    ;

    userSettings = {
      auto_update = true;
      cli_default_open_behavior = "existing_window";
      disable_ai = true;
      code_lens = "off";
      inlay_hints = {
        show_background = false;
        enabled = true;
      };
      session = {
        trust_all_worktrees = true;
      };
      base_keymap = "VSCode";
      icon_theme = {
        mode = "dark";
        light = "Zed (Default)";
        dark = "Material Icon Theme";
      };
      ui_font_size = 16;
      buffer_font_size = 15;
      theme = {
        mode = "dark";
        light = "Ayu Light";
        dark = "Colorizer Pro";
      };
    };
  };
}
