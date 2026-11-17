{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    proton-pass
    proton-vpn
    protonmail-desktop
  ];
}
