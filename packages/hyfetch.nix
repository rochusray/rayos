{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hyfetch
    macchina
  ];
}
