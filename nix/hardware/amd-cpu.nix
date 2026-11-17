{ ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  boot.kernelModules = [ "kvm-amd" ];
  hardware.cpu.amd = {
    updateMicrocode = true;
    sev.enable = true;
  };
}
