{
  description = "RayOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, disko, ... }:
    let
      rayosConfig = import ./config.nix;
    in
    {
      nixosConfigurations.rayos = nixpkgs.lib.nixosSystem {
        system = rayosConfig.system;

        modules = [
          # Disko
          disko.nixosModules.disko
          ({ ... }: {
            disko.devices.disk.main = {
              type = "disk";
              device = rayosConfig.disk;

              content = {
                type = "gpt";

                partitions = {
                  ESP = {
                    size = "512M";
                    type = "EF00";

                    content = {
                      type = "filesystem";

                      format = "vfat";
                      mountpoint = "/boot";
                      mountOptions = [ "umask=0077" ];
                    };
                  };

                  root = {
                    size = "100%";

                    content = {
                      type = "filesystem";
                      format = "ext4";
                      mountpoint = "/";
                    };
                  };
                };
              };
            };
          })

          ./hardware-configuration.nix

          ({ ... }: {

            networking.hostName = rayosConfig.hostname;

            boot.loader.systemd-boot.enable = true;
            boot.loader.efi.canTouchEfiVariables = true;

            time.timeZone = rayosConfig.timezone;
            i18n.defaultLocale = rayosConfig.locale;

            services.getty.autologinUser = "root";
            users.mutableUsers = false;
            users.allowNoPasswordLogin = true;

            system.stateVersion = "26.05";

            virtualisation.vmVariant = {
              virtualisation.memorySize = 2048;
              virtualisation.cores = 2;
              virtualisation.graphics = true;
              virtualisation.diskSize = 8192;
            };
          })
        ];
      };
    };
}
