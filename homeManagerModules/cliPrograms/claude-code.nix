{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.cliprograms.claude-code;
in
{
  options.cliprograms.claude-code.enable = lib.mkEnableOption "Claude Code";

  config = lib.mkIf cfg.enable {
    programs.claude-code.enable = true;
    #home.packages = with pkgs; [
      
    #];
  };
}
