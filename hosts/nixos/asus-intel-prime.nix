{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  config = lib.mkIf (config.specialisation != { }) {
    # Config that should only apply to the default system, not the specialised ones

    services.xserver.videoDrivers = [ "nvidia" ];
    # services.xserver.videoDrivers = ["amdgpu"];
    hardware.nvidia = {
      powerManagement.enable = true;
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };

    # For Docker
    hardware.nvidia-container-toolkit.enable = true;

    hardware.nvidia.prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      # integrated
      intelBusId = "PCI:0:2:0";

      # dedicated
      nvidiaBusId = "PCI:1:0:0";
    };

    services.udev.extraRules = ''
      KERNEL=="card*",     DRIVERS=="i915",                     SYMLINK+="dri/by-driver/intel-card"
      KERNEL=="card*",     DRIVERS=="nvidia",                   SYMLINK+="dri/by-driver/nvidia-card"
    '';
    environment.sessionVariables = {
      KWIN_DRM_DEVICES = "/dev/dri/by-driver/nvidia-card:/dev/dri/by-driver/intel-card";
    };
  };
}
