{ pkgs, ... }:

# Requires: cc

{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      rust-analyzer
    ];
  };

  environment.systemPackages = with pkgs; [
    rustup
  ];
}
