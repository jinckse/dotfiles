# dotfiles

Personal configuration for bash, Vim, Neovim and xterm.

| File | Linked to | Purpose |
|---|---|---|
| `.bashrc` | `~/.bashrc` | Shell settings, prompt, history size, `~/go/bin` on `PATH` |
| `.bash_aliases` | `~/.bash_aliases` | Aliases (`ll`, `ls`, `dm`, `klog`, ...) |
| `.vimrc` | `~/.vimrc` | Vim settings and Vundle plugins |
| `nvim/` | `~/.config/nvim` | Neovim config: options, keymaps, completion, LSP, colorscheme |
| `.Xdefaults` | `~/.Xdefaults` | xterm font and colors |

## Install

```bash
git clone https://github.com/jinckse/dotfiles ~/projects/dotfiles
~/projects/dotfiles/install.sh
```

`install.sh` symlinks each file into place and clones Vundle into
`~/.vim/bundle/Vundle.vim`. It's safe to re-run: correct links are left alone,
and an existing real file is moved to `<name>.bak.<timestamp>` instead of being
overwritten.

Afterwards:

- **Vim:** run `:PluginInstall` once to fetch the plugins.
- **Neovim:** start `nvim` and accept the prompt to install plugins. Plugin
  versions are pinned in `nvim/nvim-pack-lock.json`.

## Requirements

### Neovim 0.12 or later

The config uses `vim.pack`, which older versions don't have (Ubuntu 22.04's
packaged 0.6.1 won't work). To install the official release without root:

```bash
# download nvim-linux-x86_64.tar.gz from https://github.com/neovim/neovim/releases
tar -xzf nvim-linux-x86_64.tar.gz -C ~/.local
mkdir -p ~/.local/bin
ln -sfn ~/.local/nvim-linux-x86_64/bin/nvim ~/.local/bin/nvim
```

To upgrade, delete `~/.local/nvim-linux-x86_64` and unpack the new tarball.

### Language servers (optional)

Neovim enables each server only if it's installed, so install the ones you need:

| Language | Server | Install |
|---|---|---|
| C, C++ | clangd | `sudo apt install clangd` |
| Go | gopls | `go install golang.org/x/tools/gopls@latest` |
| Rust | rust-analyzer | `rustup component add rust-analyzer` |
| TOML | taplo | `cargo install taplo-cli --locked --features lsp` |
| Lua | lua-language-server | Release tarball from [LuaLS/lua-language-server](https://github.com/LuaLS/lua-language-server/releases) |
| Shell | bash-language-server | `npm i -g bash-language-server` (needs Node.js) |

### Nerd Font (optional)

blink.cmp shows completion-kind icons from a
[Nerd Font](https://www.nerdfonts.com/). Without one, the icons show as boxes
or blanks; completion still works.

## Notes

- **xterm over SSH:** `.Xdefaults` is only read when the X display has no
  resource database loaded, which is the case with SSH X forwarding. On a local
  desktop session, put these settings in `~/.Xresources` instead.
- **Tabs:** Vim and Neovim both use 4-column spaces, except Go and Makefiles,
  which keep real tabs.
