#!/bin/bash
set -euo pipefail

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# link <file in repo> <destination>
# Safe to re-run: skips links that are already correct, and moves an existing
# real file or directory aside to <destination>.bak.<timestamp> instead of failing.
link() {
    local src="${BASEDIR}/$1"
    local dst="$2"

    if [ "$(readlink "$dst")" = "$src" ]; then
        echo "ok      $dst"
        return
    fi

    mkdir -p "$(dirname "$dst")"

    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        local backup="${dst}.bak.$(date +%Y%m%d-%H%M%S)"
        mv "$dst" "$backup"
        echo "backup  $dst -> $backup"
    fi

    # -f replaces a symlink pointing elsewhere; -n treats an existing link to a
    # directory as the link itself, rather than creating the new link inside it
    ln -sfn "$src" "$dst"
    echo "linked  $dst -> $src"
}

# vim
link .vimrc ~/.vimrc

# Vundle plugin manager; run :PluginInstall in Vim afterwards to fetch plugins
VUNDLE_DIR=~/.vim/bundle/Vundle.vim
if [ -d "$VUNDLE_DIR" ]; then
    echo "ok      $VUNDLE_DIR"
else
    git clone --quiet https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"
    echo "cloned  $VUNDLE_DIR"
fi

# neovim
link nvim ~/.config/nvim

# bash
link .bash_aliases ~/.bash_aliases
link .bashrc ~/.bashrc

# X
link .Xdefaults ~/.Xdefaults
