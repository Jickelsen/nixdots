{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.services.ollama-webui;
in
{
  options.services.ollama-webui.enable = lib.mkEnableOption "Ollama with webui";

  config = lib.mkIf cfg.enable {
    services.ollama = {
      enable = true;
      acceleration = "cuda";
      # Optional: load models on startup
      # loadModels = [ "deepseek-r1:14b" ];
    };
    services.open-webui.enable = true;
  };
}
