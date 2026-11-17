{
  username ? "user",
  hostname ? "NixOS",
  modules ? [ ],
  encrypted ? false,
  ...
}:

{
  imports = [
    "${fetchTarball "https://github.com/nix-community/home-manager/archive/release-26.05.tar.gz"}/nixos"
  ];

  services.xserver.enable = true;
  services.displayManager.autoLogin = {
    enable = encrypted;
    user = username;
  };
  security.sudo.wheelNeedsPassword = !encrypted;

  networking = {
    hostName = hostname;
    networkmanager = {
      enable = true;
    };
  };

  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    initialPassword = username;
  };

  home-manager.users."${username}" = {
    home.stateVersion = "26.05";

    imports = modules;
  };
}
