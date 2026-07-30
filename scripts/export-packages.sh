#!/bin/bash
# ABOUTME: Exports explicitly installed Arch packages to lists at the repo root.
# ABOUTME: Restore with: sudo pacman -S --needed - < pacman.packages (yay for aur.packages)

cd "$(dirname "$0")/.." || exit 1

pacman -Qqen > pacman.packages
pacman -Qqem > aur.packages

echo "Wrote $(wc -l < pacman.packages) native packages to pacman.packages"
echo "Wrote $(wc -l < aur.packages) foreign/AUR packages to aur.packages"
