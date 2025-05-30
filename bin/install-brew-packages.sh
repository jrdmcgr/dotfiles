#!/bin/bash
set -euo pipefail

declare -a brews=(
    bash
    bat
    btop
    fd
    fx
    fzf
    gh
    git
    git-delta
    gping
    httpie
    jq
    lazygit
    lsd
    mtr
    nmap
    procs
    psysh
    ripgrep
    shellcheck
    starship
    stow
    tokei
    zoxide
)

for pkg in "${brews[@]}"; do
    echo "Installing $pkg..."
    if brew list --formula | grep -q "^$pkg\$"; then
        echo "$pkg is already installed, skipping."
        continue
    else
        brew install "$pkg"
    fi
    echo "$pkg installed successfully."
done
