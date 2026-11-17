{
  lib,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./bootloader/efi-grub.nix

    (import ./core/desktop.nix {
      username = "Rochus";
      hostname = "RochusPC";
      encrypted = true;
      modules = [
        ./modules/ssh.nix
        ./modules/git.nix
        (import ./modules/github.nix {
          username = "RochusRay";
          email = "rochusray@proton.me";
        })
        (import ./modules/zed.nix {
          inherit lib;
          languages = [
            "nix"
            "rust"
            "wgsl"
            "git"
            "md"
          ];
        })
        (import ./modules/hyfetch.nix {
          disks = [
            "/"
          ];
          # Get with "ip addr"
          networkInterface = "enp8s0";
        })
        ./modules/librewolf.nix
      ];
    })
    ./local/de.nix
    ./themes/dark.nix

    ./packages/cosmic-desktop.nix
    ./packages/cc.nix
    ./packages/rust-lang.nix
    ./packages/nix-lang.nix
    ./packages/git.nix
    ./packages/ssh.nix
    ./packages/librewolf.nix
    ./packages/blender.nix
    ./packages/tilix.nix
    ./packages/ripgrep.nix
    ./packages/proton.nix

    ./packages/themes.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.channel.enable = true;
  system.copySystemConfiguration = true;
  system.stateVersion = "26.05";
}
