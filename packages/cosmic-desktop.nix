{ pkgs, ... }:

{
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic = {
    enable = true;
    # xwayland = true;
  };
  environment.cosmic.excludePackages = with pkgs; [
    cosmic-term
    cosmic-edit
  ];
  services.system76-scheduler.enable = true;
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
}
