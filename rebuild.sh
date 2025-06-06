#!/usr/bin/env bash
#
# A rebuild script that commits on a successful build
# Modified from https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5
set -e

# cd to your config dihr
pushd ~/.config/nix

# Early return if no changes were detected (thanks @singiamtel!)
if git diff --cached --quiet '*.nix'; then
  echo "No changes detected, exiting."
  popd
  exit 0
fi

# Autoformat your nix files
# alejandra . &>/dev/null ||
#   (
#     alejandra .
#     echo "formatting failed!" && exit 1
#   )

# Shows your changes
git diff -U0 '*.nix'

echo "NixOS Rebuilding..."


git add -A

# Rebuild, output simplified errors, log trackebacks
# sudo nixos-rebuild switch --flake . &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)
nh os switch

# Get current generation metadata
current=$(nixos-rebuild list-generations | grep current)

# Commit all changes witih the generation metadata
git commit -am "$current"

# Back to where you were
popd

# Notify all OK!
notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available
